module Graphics.Ship exposing (ship)

import Html.Attributes exposing (style)
import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


ship angle x_ y_ =
    svg
        [ viewBox "0 0 100 50"
        , x x_
        , y y_
        , class "ship"
        , width "80"
        , height "40"
        ]
        [ g
            [ SA.style <| "transform-origin: 50% 50%; transform:" ++ "rotate(" ++ String.fromFloat (angle - 180) ++ "deg)"
            ]
            [ Svg.path
                [ fill "#6e4630"
                , stroke "#000"
                , strokeWidth "3"
                , d "M2.058 24.905 24.056 1.352h74.255V49H24.155L2.058 24.905Z"
                ]
                []
            , Svg.path
                [ fill "#d8d8d8"
                , stroke "#000"
                , d "m31.214 8.172.175 31.816M43.214 8.172l.175 31.816M54.214 8.172l.175 31.816M65.214 8.172l.175 31.816M76.214 8.172l.175 31.816M87.214 8.172l.175 31.816"
                ]
                []
            ]
        ]
