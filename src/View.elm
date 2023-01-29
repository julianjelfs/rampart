module View exposing (..)

import Countdown.View as Countdown
import Data exposing (Castle(..), Model, Msg(..), Phase(..), Point)
import Graphics.Cannon as Cannon
import Graphics.Castle as CastleSvg
import Graphics.Ship as Ship
import Html exposing (Html, button, div)
import Html.Attributes as H exposing (style)
import Set exposing (Set)
import Shapes exposing (Shape, isAdjacent, overlapsShape, subtractPoint)
import Svg exposing (Attribute, Svg, rect, svg, text)
import Svg.Attributes exposing (..)
import Svg.Events exposing (onClick, onMouseOut, onMouseOver)


view : Model -> Html Msg
view model =
    case model.phase of
        Start ->
            startView

        _ ->
            div []
                [ case ( model.phase, model.mousePos ) of
                    ( Placing, Just ( left, top ) ) ->
                        div
                            [ H.style "left" (String.fromInt (left + 10) ++ "px")
                            , H.style "top" (String.fromInt top ++ "px")
                            , class "cannon-count"
                            ]
                            [ text <| String.fromInt model.availableCannon ]

                    _ ->
                        text ""
                , Html.map CountdownMsg (Countdown.view model.countdown)
                , svg [ preserveAspectRatio "none", class "root", width "100%", height "100%", viewBox "0 0 1000 800" ]
                    (grid model)
                ]


startView : Html Msg
startView =
    div [ class "welcome" ]
        [ div [ class "welcome__card" ]
            [ div [ class "welcome__title" ] [ text "Welcome to Rampart" ]
            , button [ onClick StartGame, class "welcome__start" ] [ text "Start" ]
            ]
        ]


floatToPixelString : Float -> String
floatToPixelString f =
    String.fromFloat f ++ "px"


isCellShadowed : Point -> Point -> Shape -> Bool
isCellShadowed cell overCell currentShape =
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
grid { spec, phase, walls, cannon, buildable, currentShape, overCell } =
    let
        cellWidth =
            1000 / toFloat (Tuple.first spec.dimensions)

        cellHeight =
            800 / toFloat (Tuple.second spec.dimensions)

        cols =
            List.range 0 (Tuple.first spec.dimensions)

        rows =
            List.range 0 (Tuple.second spec.dimensions)

        ships =
            [ Ship.ship "700" "100"
            , Ship.ship "800" "350"
            , Ship.ship "650" "420"
            , Ship.ship "850" "550"
            ]

        castles =
            spec.castles
                |> List.map
                    (\(Castle ( x, y )) ->
                        CastleSvg.castle (CellClicked ( x, y ))
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
                        wall =
                            Set.member ( c, r ) walls

                        cannon_ =
                            Set.member ( c, r ) cannon

                        buildable_ =
                            Set.member ( c, r ) buildable

                        shadowed =
                            if phase /= Building then
                                False

                            else
                                Maybe.map2
                                    (\shape over ->
                                        isCellShadowed ( c, r ) over shape
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
                            , ( "grid__cell--even", modBy 2 r == 1 && modBy 2 c == 0 || modBy 2 r == 0 && modBy 2 c == 1 )
                            , ( "grid__cell--sea", c >= 30 )
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
        ++ ships
