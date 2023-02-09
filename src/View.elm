module View exposing (..)

import Countdown.View as Countdown
import Data exposing (Castle(..), Model, Msg(..))
import Dict
import Graphics.Cannon as Cannon
import Graphics.Cannonball as Cannonball
import Graphics.Castle as CastleSvg
import Graphics.Ship as Ship
import Graphics.Target as Target
import Html exposing (Html, button, div)
import Html.Attributes as H
import Position exposing (Cell)
import Set
import Shapes exposing (Shape, isAdjacent, overlapsShape, subtractCell)
import Ship
import Svg exposing (Attribute, Svg, rect, svg, text)
import Svg.Attributes exposing (..)
import Svg.Events exposing (onClick, onMouseOut, onMouseOver)
import Workflow


view : Model -> Html Msg
view model =
    let
        ( w, h ) =
            model.viewport
    in
    if Workflow.starting model.phase then
        startView

    else if Workflow.gameOver model.phase then
        gameOverView

    else
        div []
            [ if Workflow.placing model.phase then
                case model.mousePos of
                    Just ( left, top ) ->
                        div
                            [ H.style "left" (String.fromInt (left + 10) ++ "px")
                            , H.style "top" (String.fromInt top ++ "px")
                            , class "cannon-count"
                            ]
                            [ text <| String.fromInt model.availableCannon ]

                    _ ->
                        text ""

              else
                text ""
            , Html.map CountdownMsg (Countdown.view model.countdown)
            , svg
                [ preserveAspectRatio "none"
                , class "root"
                , width "100%"
                , height "100%"
                , viewBox <| "0 0 " ++ String.fromFloat w ++ " " ++ String.fromFloat h
                ]
                (grid model)
            ]


gameOverView : Html Msg
gameOverView =
    div [ class "welcome" ]
        [ div [ class "welcome__card" ]
            [ div [ class "welcome__title" ] [ text "Game Over!" ]
            , button [ onClick StartGame, class "welcome__start" ] [ text "New game" ]
            ]
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


isCellShadowed : Cell -> Cell -> Shape -> Bool
isCellShadowed cell overCell currentShape =
    isAdjacent cell overCell
        && overlapsShape (subtractCell cell overCell) currentShape


classList : List ( String, Bool ) -> Attribute msg
classList list =
    list
        |> List.filter Tuple.second
        |> List.map Tuple.first
        |> String.join " "
        |> class


grid : Model -> List (Svg Msg)
grid { spec, phase, walls, cannon, buildable, currentShape, overCell, viewport, ships, cannonballs } =
    let
        ( screenWidth, screenHeight ) =
            viewport

        cellWidth =
            screenWidth / toFloat (Tuple.first spec.dimensions)

        cellHeight =
            screenHeight / toFloat (Tuple.second spec.dimensions)

        cols =
            List.range 0 (Tuple.first spec.dimensions)

        rows =
            List.range 0 (Tuple.second spec.dimensions)

        castles =
            spec.castles
                |> List.map
                    (\(Castle ( x, y )) ->
                        CastleSvg.castle (CastleSelected (Castle ( x, y )))
                            (cellWidth * 2 |> String.fromFloat)
                            (cellHeight * 2 |> String.fromFloat)
                            (toFloat x * cellWidth |> String.fromFloat)
                            (toFloat y * cellHeight |> String.fromFloat)
                    )

        ships_ =
            ships
                |> List.map
                    (\ship ->
                        Ship.ship ship.shipType (Ship.shipAngle ship.vector) (Tuple.first ship.pos |> String.fromFloat) (Tuple.second ship.pos |> String.fromFloat)
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

        allCannonballs =
            ships
                |> List.filterMap .cannonball
                |> List.append (Dict.values cannonballs)

        targets =
            allCannonballs
                |> List.map
                    (\c ->
                        Target.target
                            cellWidth
                            cellHeight
                            c.target
                    )

        cannonballs_ =
            ships
                |> List.filterMap .cannonball
                |> List.append (Dict.values cannonballs)
                |> List.map
                    (\{ pos, ballType } ->
                        Cannonball.cannonball ballType pos
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
                            if not (Workflow.building phase) then
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
        ++ ships_
        ++ cannonballs_
        ++ targets
