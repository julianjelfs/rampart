module Graphics.Target exposing (target)

import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


target w h ( x_, y_ ) =
    svg
        [ viewBox "0 0 24 24"
        , class "target"
        , width (String.fromFloat w)
        , height (String.fromFloat h)
        , x (String.fromFloat (x_ - w / 2))
        , y (String.fromFloat (y_ - h / 2))
        ]
        [ Svg.circle
            [ cx "12"
            , cy "12"
            , r "12"
            , fill "rgba(255,0,0,.27)"
            ]
            []
        , Svg.circle
            [ cx "12"
            , cy "12"
            , r "8"
            , fill "rgba(255,0,0,.56)"
            ]
            []
        , Svg.circle
            [ cx "12"
            , cy "12"
            , r "4"
            , fill "red"
            ]
            []
        ]
