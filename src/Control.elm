module Control exposing (..)

import Browser.Events exposing (onKeyDown, onMouseMove)
import Countdown.Control as Countdown
import Data exposing (Model, Msg(..), Phase(..), roundOne)
import FloodFill exposing (findBuildableCells)
import Json.Decode as D
import Set exposing (Set)
import Shapes exposing (cellsOccupiedByShape, getRandomShape, rotate90)
import TestData exposing (enclosed)


init : ( Model, Cmd Msg )
init =
    let
        cannon =
            Set.fromList [ ( 2, 6 ), ( 3, 6 ), ( 4, 6 ) ]
    in
    ( { spec = roundOne
      , walls = enclosed
      , cannon = cannon
      , buildable = findBuildableCells roundOne enclosed cannon
      , currentShape = Nothing
      , overCell = Nothing
      , phase = Building
      , countdown = Countdown.init 30
      }
    , getRandomShape
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CountdownMsg subMsg ->
            let
                subModel =
                    Countdown.update subMsg model.countdown
            in
            ( { model | countdown = subModel }, Cmd.none )

        CellClicked cell ->
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
