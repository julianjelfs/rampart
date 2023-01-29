module Graphics.Ship exposing (ship)

import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


ship x_ y_ =
    svg
        [ viewBox "0 0 100 50"
        , x x_
        , y y_
        , width "100"
        , height "50"
        ]
        [ Svg.path
            [ fill "#6f3e1c"
            , stroke "#000000"
            , strokeWidth "3"
            , d "M36.353 5h38.141C85.764 5 95 14.651 95 21.894v4.87C95 34.007 87.665 45 74.117 45H36.976C24.556 44.368 8.21 37.605 5 26.416v-4.477C6.458 12.093 23.516 6.356 36.353 5Z"
            ]
            []
        ]
