module Control exposing (..)

import Browser.Events exposing (onKeyDown, onMouseMove)
import Countdown.Control as Countdown
import Data exposing (Model, Msg(..), Phase(..), Point, defaultCastle, roundOne)
import FloodFill exposing (findBuildableCells, findEnclosedCastles)
import Json.Decode as D
import Process
import Set exposing (Set)
import Shapes exposing (cellsOccupiedByShape, getRandomShape, rotate90)
import Task
import TestData exposing (enclosed)


init : ( Model, Cmd Msg )
init =
    ( { spec = roundOne
      , walls = Set.empty
      , cannon = Set.empty
      , buildable = Set.empty
      , currentShape = Nothing
      , overCell = Nothing
      , phase = Start
      , countdown = Countdown.init
      , base = Nothing
      , availableCannon = 3
      , mousePos = Nothing
      }
    , getRandomShape
    )


autoEnclose : Int -> Point -> List Point
autoEnclose padding ( x, y ) =
    let
        xr =
            List.range (x - padding) (x + padding)

        yr =
            List.range (y - padding) (y + padding)

        top =
            List.map (\x_ -> ( x_, y - padding )) xr

        bottom =
            List.map (\x_ -> ( x_, y + padding )) xr

        left =
            List.map (\y_ -> ( x - padding, y_ )) yr

        right =
            List.map (\y_ -> ( x + padding, y_ )) yr

        all =
            top ++ right ++ List.reverse bottom ++ List.reverse left
    in
    all


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MouseMove p ->
            ( { model | mousePos = Just p }, Cmd.none )

        SelectBase p ->
            ( { model | base = Just p }, Cmd.none )

        StartGame ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.selectCastle
            in
            ( { model | phase = CastleSelection, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        CountdownMsg subMsg ->
            let
                ( subModel, finished ) =
                    Countdown.update subMsg model.countdown
            in
            case ( model.phase, finished ) of
                ( CastleSelection, True ) ->
                    if model.base == Nothing then
                        selectCastle defaultCastle model

                    else
                        let
                            ( countdown, countdownCmd ) =
                                Countdown.placeCannon
                        in
                        ( { model | phase = Placing, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

                ( Placing, True ) ->
                    let
                        ( countdown, countdownCmd ) =
                            Countdown.prepareForBattle
                    in
                    ( { model | phase = Battling, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

                ( Battling, True ) ->
                    let
                        ( countdown, countdownCmd ) =
                            Countdown.buildAndRepair
                    in
                    ( { model | phase = Building, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

                ( Building, True ) ->
                    let
                        -- if you have no enclosed castles then I guess it's game over
                        enclosed =
                            findEnclosedCastles model.spec model.walls model.cannon

                        ( countdown, countdownCmd ) =
                            Countdown.placeCannon
                    in
                    ( { model | phase = Placing, countdown = countdown, availableCannon = model.availableCannon + 1 + Set.size enclosed }, Cmd.map CountdownMsg countdownCmd )

                _ ->
                    ( { model | countdown = subModel }, Cmd.none )

        BuildWall blocks ->
            case blocks of
                x :: xs ->
                    let
                        walls =
                            Set.insert x model.walls
                    in
                    ( { model | walls = walls, buildable = findBuildableCells model.spec walls model.cannon }
                    , Task.perform (\_ -> BuildWall xs) (Process.sleep 100)
                    )

                _ ->
                    let
                        ( countdown, countdownCmd ) =
                            Countdown.placeCannon
                    in
                    ( { model | phase = Placing, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        CellClicked cell ->
            case model.phase of
                Placing ->
                    placeCannon cell model

                CastleSelection ->
                    selectCastle cell model

                Building ->
                    case model.currentShape of
                        Nothing ->
                            ( model, Cmd.none )

                        Just shape ->
                            let
                                footprint =
                                    cellsOccupiedByShape cell shape

                                obstacles =
                                    Set.union model.walls model.cannon |> Set.union model.spec.castles

                                valid =
                                    Set.intersect footprint obstacles |> Set.isEmpty

                                walls =
                                    if valid then
                                        Set.union model.walls footprint

                                    else
                                        model.walls

                                buildable =
                                    if valid then
                                        findBuildableCells model.spec walls model.cannon

                                    else
                                        model.buildable

                                cmd =
                                    if valid then
                                        getRandomShape

                                    else
                                        Cmd.none
                            in
                            ( { model
                                | walls = walls
                                , buildable = buildable
                              }
                            , cmd
                            )

                _ ->
                    ( model, Cmd.none )

        MouseOver p ->
            ( { model | overCell = Just p }, Cmd.none )

        MouseOut ->
            ( { model | overCell = Nothing }, Cmd.none )

        KeyDown code ->
            case code of
                32 ->
                    ( { model | currentShape = Maybe.map rotate90 model.currentShape }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        NextShape shape ->
            ( { model | currentShape = Just shape }, Cmd.none )


selectCastle : Point -> Model -> ( Model, Cmd Msg )
selectCastle cell model =
    if Set.member cell model.spec.castles && model.base == Nothing then
        let
            walls =
                autoEnclose 3 cell
        in
        ( { model | base = Just cell }, Task.perform (\_ -> BuildWall walls) (Task.succeed ()) )

    else
        ( model, Cmd.none )


placeCannon : Point -> Model -> ( Model, Cmd Msg )
placeCannon cell model =
    let
        remaining =
            model.availableCannon - 1

        phase =
            if remaining == 0 then
                Battling

            else
                model.phase

        ( countdown, countdownCmd ) =
            if remaining == 0 then
                Countdown.prepareForBattle

            else
                ( model.countdown, Cmd.none )
    in
    if Set.member cell model.buildable && model.availableCannon > 0 then
        ( { model | cannon = Set.insert cell model.cannon, availableCannon = remaining, phase = phase, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

    else
        ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        countdown =
            Sub.map CountdownMsg (Countdown.subscriptions model.countdown)

        mousePos =
            if model.phase == Placing then
                onMouseMove (D.map MouseMove mousePosDecoder)

            else
                Sub.none
    in
    Sub.batch
        [ countdown
        , mousePos
        , case model.currentShape of
            Nothing ->
                Sub.none

            Just shape ->
                onKeyDown (D.map KeyDown keyDecoder)
        ]


keyDecoder : D.Decoder Int
keyDecoder =
    D.field "keyCode" D.int


mousePosDecoder : D.Decoder ( Int, Int )
mousePosDecoder =
    D.map2 Tuple.pair (D.field "clientX" D.int) (D.field "clientY" D.int)
