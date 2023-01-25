module View2 exposing (..)

import Countdown.View as Countdown
import Data exposing (Model, Msg(..), Point)
import Graphics.Cannon as Cannon
import Graphics.Castle as Castle
import Html exposing (Html, div)
import Matrix exposing (Matrix)
import Set exposing (Set)
import Shapes exposing (Shape, isAdjacent, overlapsShape, subtractPoint)
import Svg exposing (Attribute, Svg, rect, svg, text)
import Svg.Attributes exposing (..)
import Svg.Events exposing (onClick, onMouseOut, onMouseOver)


view : Model -> Html Msg
view model =
    div []
        [ Html.map CountdownMsg (Countdown.view model.countdown)
        , svg [ preserveAspectRatio "none", class "root", width "100%", height "100%", viewBox "0 0 1000 800" ]
            (grid model)
        ]


floatToPixelString : Float -> String
floatToPixelString f =
    String.fromFloat f ++ "px"


isCellShadowed : Set Point -> Set Point -> Set Point -> Point -> Point -> Shape -> Bool
isCellShadowed walls cannon castles cell overCell currentShape =
    isAdjacent cell overCell
        && overlapsShape (subtractPoint cell overCell) currentShape


classList : List ( String, Bool ) -> Attribute msg
classList list =
    list
        |> List.filter Tuple.second
        |> List.map Tuple.first
        |> String.join " "
        |> class


grid : Model -> List (Svg Msg)
grid { spec, walls, cannon, buildable, currentShape, overCell } =
    let
        cellWidth =
            1000 / toFloat (Tuple.first spec.dimensions)

        cellHeight =
            800 / toFloat (Tuple.second spec.dimensions)

        cols =
            List.range 0 (Tuple.first spec.dimensions)

        rows =
            List.range 0 (Tuple.second spec.dimensions)

        castles =
            Set.toList spec.castles
                |> List.map
                    (\( x, y ) ->
                        Castle.castle
                            (cellWidth |> String.fromFloat)
                            (cellHeight |> String.fromFloat)
                            (toFloat x * cellWidth |> String.fromFloat)
                            (toFloat y * cellHeight |> String.fromFloat)
                    )

        cannons =
            Set.toList cannon
                |> List.map
                    (\( x, y ) ->
                        Cannon.cannon
                            (cellWidth |> String.fromFloat)
                            (cellHeight |> String.fromFloat)
                            (toFloat x * cellWidth |> String.fromFloat)
                            (toFloat y * cellHeight |> String.fromFloat)
                    )
    in
    List.concatMap
        (\r ->
            List.map
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

                        shadowed =
                            Maybe.map2
                                (\shape over ->
                                    isCellShadowed walls cannon spec.castles ( c, r ) over shape
                                )
                                currentShape
                                overCell
                                |> Maybe.withDefault False
                    in
                    rect
                        [ class "grid__cell"
                        , x (toFloat c * cellWidth |> String.fromFloat)
                        , y (toFloat r * cellHeight |> String.fromFloat)
                        , width (String.fromFloat cellWidth)
                        , height (String.fromFloat cellHeight)
                        , onClick (CellClicked ( c, r ))
                        , onMouseOver (MouseOver ( c, r ))
                        , onMouseOut MouseOut
                        , classList
                            [ ( "grid__cell--land", c < 30 )
                            , ( "grid__cell--sea", c >= 30 )
                            , ( "grid__cell--castle", castle )
                            , ( "grid__cell--cannon", cannon_ )
                            , ( "grid__cell--buildable", buildable_ )
                            , ( "grid__cell--wall", wall )
                            , ( "grid__cell--shadow", shadowed )
                            ]
                        ]
                        []
                )
                cols
        )
        rows
        ++ castles
        ++ cannons
