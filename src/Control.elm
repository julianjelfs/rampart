module Control exposing (..)

import Browser.Events exposing (onKeyDown, onMouseMove)
import Data exposing (Model, Msg(..), roundOne)
import FloodFill exposing (findBuildableCells)
import Json.Decode as D
import Set exposing (Set)
import Shapes exposing (getRandomShape, rotate90)
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
      }
    , getRandomShape
    )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CellClicked cell ->
            let
                walls =
                    if Set.member cell model.walls then
                        Set.remove cell model.walls

                    else
                        Set.insert cell model.walls
            in
            ( { model
                | walls = walls
                , buildable = findBuildableCells model.spec walls model.cannon
              }
            , getRandomShape
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
    case model.currentShape of
        Nothing ->
            Sub.none

        Just shape ->
            onKeyDown (D.map KeyDown keyDecoder)


keyDecoder : D.Decoder Int
keyDecoder =
    D.field "keyCode" D.int
