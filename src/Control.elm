module Control exposing (..)

import Browser.Events exposing (onMouseMove)
import Data exposing (Model, Msg(..), roundOne)
import FloodFill exposing (findBuildableCells)
import Json.Decode as D
import Set exposing (Set)
import Shapes exposing (getRandomShape)
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
      , mousePos = ( 0, 0 )
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

        MouseMove pos ->
            ( { model | mousePos = pos }, Cmd.none )

        NextShape shape ->
            ( { model | currentShape = Just shape }, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model.currentShape of
        Nothing ->
            Sub.none

        Just shape ->
            onMouseMove (D.map MouseMove positionDecoder)


positionDecoder : D.Decoder ( Float, Float )
positionDecoder =
    D.map2 (\x y -> ( x, y ))
        (D.field "clientX" D.float)
        (D.field "clientY" D.float)
