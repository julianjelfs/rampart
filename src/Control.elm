module Control exposing (..)

import Browser.Dom exposing (getViewport)
import Browser.Events exposing (onAnimationFrameDelta, onKeyDown, onMouseMove)
import Cannonball
import Countdown.Control as Countdown
import Countdown.Data exposing (CountdownResult(..))
import Data exposing (Castle(..), Model, Msg(..), defaultCastle, roundOne)
import Dict exposing (Dict)
import FloodFill exposing (findBuildableCells, findEnclosedCastles)
import Json.Decode as D
import Position exposing (Cell)
import Process
import Set exposing (Set)
import Shapes exposing (cellsOccupiedByShape, getRandomShape, rotate90)
import Ship
import Task
import TestData exposing (enclosed)
import Workflow


initialModel : Model
initialModel =
    { spec = roundOne
    , walls = Set.empty
    , cannon = Set.empty
    , cannonballs = Dict.empty
    , buildable = Set.empty
    , currentShape = Nothing
    , overCell = Nothing
    , phase = Workflow.init
    , countdown = Countdown.init
    , castleSelected = False
    , availableCannon = 3
    , mousePos = Nothing
    , viewport = ( 0, 0 )
    , ships = []
    , toPixel = \_ -> ( 0, 0 )
    , toCell = \_ -> ( 0, 0 )
    }


init : ( Model, Cmd Msg )
init =
    ( initialModel
    , Cmd.batch
        [ getRandomShape
        , Task.perform SetViewport getViewport
        ]
    )


autoEnclose : Int -> Cell -> List Cell
autoEnclose padding ( x, y ) =
    let
        xr =
            List.range (x - padding) (x + padding + 1)

        yr =
            List.range (y - padding) (y + padding + 1)

        top =
            List.map (\x_ -> ( x_, y - padding )) xr

        bottom =
            List.map (\x_ -> ( x_, y + padding + 1 )) xr

        left =
            List.map (\y_ -> ( x - padding, y_ )) yr

        right =
            List.map (\y_ -> ( x + padding + 1, y_ )) yr

        all =
            top ++ right ++ List.reverse bottom ++ List.reverse left
    in
    all


frame : Float -> Model -> ( Model, Cmd Msg )
frame delta model =
    let
        movedAndDestroyed =
            Ship.moveShips model.viewport delta model.ships

        moved =
            List.map Tuple.first movedAndDestroyed

        destroyed =
            List.filterMap Tuple.second movedAndDestroyed
                |> List.map model.toCell
                |> Set.fromList

        walls =
            Set.diff model.walls destroyed

        buildable =
            if Set.size destroyed > 0 then
                findBuildableCells model.spec walls model.cannon

            else
                model.buildable

        targetCmd =
            if Workflow.battling model.phase then
                Ship.getShipTargets model.toPixel moved walls WallTargets

            else
                Cmd.none

        ( myCannonballs, arrived ) =
            Dict.foldl
                (\k ball ( dict, arr ) ->
                    case Cannonball.moveCannonball delta ball of
                        Nothing ->
                            ( dict, ball :: arr )

                        Just b ->
                            ( Dict.insert k b dict, arr )
                )
                ( Dict.empty, [] )
                model.cannonballs

        damaged =
            List.filterMap
                (\ship ->
                    if List.any (.pos >> Ship.overlapsPoint ship) arrived then
                        Nothing

                    else
                        Just ship
                )
                moved
    in
    ( { model
        | ships = damaged
        , walls = walls
        , buildable = buildable
        , cannonballs = myCannonballs
      }
    , targetCmd
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WallTargets targets ->
            ( { model | ships = Ship.setShipTargets model.ships targets }, Cmd.none )

        Frame time ->
            frame time model

        AddShip ship ->
            let
                ships =
                    ship :: model.ships
            in
            ( { model | ships = ships }
            , if List.length ships < model.spec.ships then
                Ship.getRandomShip model.viewport AddShip

              else
                Cmd.none
            )

        SetViewport { viewport } ->
            let
                ( cols, rows ) =
                    model.spec.dimensions

                cellWidth =
                    viewport.width / toFloat cols

                cellHeight =
                    viewport.height / toFloat rows

                toPixel =
                    \( x, y ) ->
                        ( toFloat x * cellWidth + cellWidth / 2
                        , toFloat y * cellHeight + cellHeight / 2
                        )

                toCell =
                    \( x, y ) ->
                        ( floor (x / cellWidth), floor (y / cellHeight) )
            in
            ( { model
                | viewport = ( viewport.width, viewport.height )
                , toPixel = toPixel
                , toCell = toCell
              }
            , Cmd.none
            )

        MouseMove p ->
            ( { model | mousePos = Just p }, Cmd.none )

        StartGame ->
            Workflow.next model

        CountdownMsg subMsg ->
            let
                phase =
                    model.phase

                ( subModel, result ) =
                    Countdown.update subMsg model.countdown
            in
            case result of
                IntroComplete ->
                    ( { model | phase = Workflow.endIntro phase, countdown = subModel }, Cmd.none )

                NoResult ->
                    ( { model | countdown = subModel }, Cmd.none )

                CountdownComplete ->
                    let
                        ( updated, cmd ) =
                            Workflow.next model
                    in
                    if Workflow.castleSelection phase then
                        if not model.castleSelected then
                            selectCastle defaultCastle model

                        else
                            ( updated, cmd )

                    else if Workflow.placing phase then
                        ( { updated | ships = [] }
                        , Cmd.batch
                            [ cmd
                            , Ship.getRandomShip model.viewport AddShip
                            ]
                        )

                    else if Workflow.battling phase then
                        ( updated, cmd )

                    else if Workflow.building phase then
                        let
                            -- if you have no enclosed castles then I guess it's game over
                            enclosed =
                                findEnclosedCastles model.spec model.walls model.cannon
                        in
                        if Set.size enclosed == 0 then
                            let
                                ( m, c ) =
                                    init
                            in
                            ( { m | phase = Workflow.endGame }, c )

                        else
                            ( { updated
                                | availableCannon = model.availableCannon + 1 + (Set.size enclosed // 4)
                              }
                            , cmd
                            )

                    else
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
                    Workflow.next model

        CastleSelected (Castle cell) ->
            if Workflow.castleSelection model.phase then
                selectCastle cell model

            else
                ( model, Cmd.none )

        CellClicked cell ->
            if Workflow.placing model.phase then
                placeCannon cell model

            else if Workflow.battling model.phase then
                let
                    cannon =
                        model.cannon
                            |> Set.toList
                            |> List.filter (\c -> not <| Dict.member c model.cannonballs)
                            |> List.head
                in
                case cannon of
                    Nothing ->
                        ( model, Cmd.none )

                    Just cannon_ ->
                        let
                            source =
                                model.toPixel cannon_

                            target =
                                model.toPixel cell

                            cannonball =
                                Cannonball.createCannonball Cannonball.Normal source target

                            cannonballs =
                                Dict.insert cannon_ cannonball model.cannonballs
                        in
                        ( { model | cannonballs = cannonballs }, Cmd.none )

            else if Workflow.building model.phase then
                case model.currentShape of
                    Nothing ->
                        ( model, Cmd.none )

                    Just shape ->
                        let
                            footprint =
                                cellsOccupiedByShape cell shape

                            obstacles =
                                Set.union model.walls model.cannon |> Set.union model.spec.castlePoints

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

            else
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


selectCastle : Cell -> Model -> ( Model, Cmd Msg )
selectCastle cell model =
    if Set.member cell model.spec.castlePoints && not model.castleSelected then
        let
            walls =
                autoEnclose 3 cell
        in
        ( { model | castleSelected = True }, Task.perform (\_ -> BuildWall walls) (Task.succeed ()) )

    else
        ( model, Cmd.none )


placeCannon : Cell -> Model -> ( Model, Cmd Msg )
placeCannon cell model =
    let
        remaining =
            model.availableCannon - 1

        countdownCmd =
            if remaining == 0 then
                Countdown.stop

            else
                Cmd.none
    in
    if Set.member cell model.buildable && model.availableCannon > 0 then
        ( { model
            | cannon = Set.insert cell model.cannon
            , availableCannon = remaining
          }
        , Cmd.map CountdownMsg countdownCmd
        )

    else
        ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    let
        countdown =
            Sub.map CountdownMsg (Countdown.subscriptions model.countdown)

        mousePos =
            if Workflow.placing model.phase then
                onMouseMove (D.map MouseMove mousePosDecoder)

            else
                Sub.none

        frameSub =
            if Workflow.animate model.phase then
                onAnimationFrameDelta Frame

            else
                Sub.none
    in
    Sub.batch
        [ countdown
        , mousePos
        , frameSub
        , case model.currentShape of
            Nothing ->
                Sub.none

            Just _ ->
                onKeyDown (D.map KeyDown keyDecoder)
        ]


keyDecoder : D.Decoder Int
keyDecoder =
    D.field "keyCode" D.int


mousePosDecoder : D.Decoder ( Int, Int )
mousePosDecoder =
    D.map2 Tuple.pair (D.field "clientX" D.int) (D.field "clientY" D.int)
