module Control exposing (..)

import Browser.Events exposing (onKeyDown, onMouseMove)
import Countdown.Control as Countdown
import Data exposing (Model, Msg(..), Phase(..), Point, roundOne)
import FloodFill exposing (findBuildableCells)
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
        SelectBase p ->
            ( { model | base = Just p }, Cmd.none )

        StartGame ->
            ( { model | phase = CastleSelection, countdown = Countdown.start "Select your starting castle" 10 }, Cmd.none )

        StartCountdown l n ->
            ( { model | countdown = Countdown.start l n }, Cmd.none )

        CountdownMsg subMsg ->
            let
                ( subModel, finished ) =
                    Countdown.update subMsg model.countdown
            in
            case ( model.phase, finished ) of
                ( CastleSelection, True ) ->
                    ( { model | phase = Placing, countdown = Countdown.start "Place your cannons!" 20 }, Cmd.none )

                ( Placing, True ) ->
                    ( { model | phase = Battling, countdown = Countdown.start "Commence battle" 20 }, Cmd.none )

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
                    ( model, Cmd.none )

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
    if Set.member cell model.spec.castles then
        let
            walls =
                autoEnclose 3 cell
        in
        ( { model | base = Just cell }, Task.perform (\_ -> BuildWall walls) (Task.succeed ()) )

    else
        ( model, Cmd.none )


placeCannon : Point -> Model -> ( Model, Cmd Msg )
placeCannon cell model =
    if Set.member cell model.buildable then
        ( { model | cannon = Set.insert cell model.cannon }, Cmd.none )

    else
        ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        countdown =
            Sub.map CountdownMsg (Countdown.subscriptions model.countdown)
    in
    Sub.batch
        [ countdown
        , case model.currentShape of
            Nothing ->
                Sub.none

            Just shape ->
                onKeyDown (D.map KeyDown keyDecoder)
        ]


keyDecoder : D.Decoder Int
keyDecoder =
    D.field "keyCode" D.int
