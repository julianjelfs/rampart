module View exposing (..)

import Data exposing (Model, Msg(..))
import Graphics.Cannon as Cannon
import Graphics.Castle as Castle
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, classList, style)
import Html.Events exposing (onClick)
import Matrix exposing (Matrix)
import Set


view : Model -> Html Msg
view model =
    grid model


floatToPixelString : Float -> String
floatToPixelString f =
    String.fromFloat f ++ "px"


drawCurrentShape : ( Float, Float ) -> Matrix Int -> Html Msg
drawCurrentShape ( x, y ) shape =
    div [ class "ghostshape", style "left" (floatToPixelString x), style "top" (floatToPixelString y) ]
        [ text (Matrix.pretty String.fromInt shape) ]


grid : Model -> Html Msg
grid { spec, walls, cannon, buildable, currentShape, mousePos } =
    let
        cols =
            List.range 0 (Tuple.first spec.dimensions)

        rows =
            List.range 0 (Tuple.second spec.dimensions)
    in
    div [ class "wrapper" ]
        [ case currentShape of
            Nothing ->
                text ""

            Just shape ->
                drawCurrentShape mousePos shape
        , div [ class "grid" ]
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
                                    , classList
                                        [ ( "grid__cell--land", c < 30 )
                                        , ( "grid__cell--sea", c >= 30 )
                                        , ( "grid__cell--castle", castle )
                                        , ( "grid__cell--buildable", buildable_ )
                                        , ( "grid__cell--wall", wall )
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
