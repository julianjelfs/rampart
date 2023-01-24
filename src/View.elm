module View exposing (..)

import Data exposing (Model, Msg(..), Point)
import Graphics.Cannon as Cannon
import Graphics.Castle as Castle
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, classList, style)
import Html.Events exposing (onClick, onMouseOut, onMouseOver)
import Matrix exposing (Matrix)
import Set exposing (Set)
import Shapes exposing (Shape, overlapsShape)


view : Model -> Html Msg
view model =
    grid model


floatToPixelString : Float -> String
floatToPixelString f =
    String.fromFloat f ++ "px"


subtractPoint : Point -> Point -> Point
subtractPoint ( x1, y1 ) ( x2, y2 ) =
    ( (x1 - x2) + 2, (y1 - y2) + 2 )


adjacent : Point -> Point -> Bool
adjacent ( x1, y1 ) ( x2, y2 ) =
    abs (x1 - x2)
        <= 1
        && abs (y1 - y2)
        <= 1


isCellShadowed : Set Point -> Set Point -> Set Point -> Point -> Point -> Shape -> Bool
isCellShadowed walls cannon castles cell overCell currentShape =
    not (Set.member cell castles)
        && not (Set.member cell cannon)
        && not (Set.member cell walls)
        && adjacent cell overCell
        && overlapsShape (subtractPoint cell overCell) currentShape


grid : Model -> Html Msg
grid { spec, walls, cannon, buildable, currentShape, mousePos, overCell } =
    let
        cols =
            List.range 0 (Tuple.first spec.dimensions)

        rows =
            List.range 0 (Tuple.second spec.dimensions)
    in
    div [ class "wrapper" ]
        [ div [ class "grid" ]
            (List.map
                (\r ->
                    div
                        [ class "grid__row"
                        ]
                        (List.map
                            (\c ->
                                let
                                    castle =
                                        Set.member ( c, r ) spec.castles

                                    wall =
                                        Set.member ( c, r ) walls

                                    cannon_ =
                                        Set.member ( c, r ) cannon

                                    buildable_ =
                                        Set.member ( c, r ) buildable
                                in
                                div
                                    [ class "grid__cell"
                                    , onClick (CellClicked ( c, r ))
                                    , onMouseOver (MouseOver ( c, r ))
                                    , onMouseOut MouseOut
                                    , classList
                                        [ ( "grid__cell--land", c < 30 )
                                        , ( "grid__cell--sea", c >= 30 )
                                        , ( "grid__cell--castle", castle )
                                        , ( "grid__cell--buildable", buildable_ )
                                        , ( "grid__cell--wall", wall )
                                        , ( "grid__cell--shadow"
                                          , Maybe.map2
                                                (\shape over ->
                                                    isCellShadowed walls cannon spec.castles ( c, r ) over shape
                                                )
                                                currentShape
                                                overCell
                                                |> Maybe.withDefault False
                                          )
                                        ]
                                    ]
                                    [ if castle then
                                        Castle.castle

                                      else if cannon_ then
                                        Cannon.cannon

                                      else
                                        text ""
                                    ]
                            )
                            cols
                        )
                )
                rows
            )
        ]
