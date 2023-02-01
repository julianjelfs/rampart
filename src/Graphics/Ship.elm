module Graphics.Ship exposing (ship)

import Html.Attributes exposing (style)
import Ship exposing (ShipType(..))
import Svg exposing (..)
import Svg.Attributes exposing (..)


ship shipType angle x_ y_ =
    let
        a =
            if angle /= 0 then
                angle - 180

            else
                angle

        color =
            case shipType of
                NormalShip ->
                    "#6e4630"

                FireShip ->
                    "red"
    in
    svg
        [ viewBox "0 0 120 120"
        , x x_
        , y y_
        , class "ship"
        , width "120"
        , height "120"
        ]
        [ g
            [ stroke "#000000", transform <| "rotate(" ++ String.fromFloat a ++ ", 60, 60)" ]
            [ Svg.path
                [ fill color
                , strokeWidth "3"
                , d "m8.569 58.908 22-23.551 74.255.006-.003 47.648-74.157-.006L8.57 58.908Z"
                ]
                []
            , Svg.path
                [ fill "#d8d8d8"
                , d "m37.726 42.177.173 31.817m11.827-31.816.173 31.817M60.727 42.18l.172 31.815M71.727 42.18l.172 31.816M82.727 42.18l.172 31.817m10.828-31.815.172 31.816"
                ]
                []
            ]
        ]
