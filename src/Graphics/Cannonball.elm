module Graphics.Cannonball exposing (cannonball)

import Cannonball exposing (CannonballType(..))
import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


cannonball ballType ( x_, y_ ) =
    let
        w =
            15

        h =
            15

        color =
            case ballType of
                Normal ->
                    "#000000"

                Fire ->
                    "red"
    in
    svg
        [ class "cannonball"
        , width (String.fromInt w)
        , height (String.fromInt h)
        , x (String.fromFloat (x_ - w / 2))
        , y (String.fromFloat (y_ - h / 2))
        , viewBox "0 0 24 24"
        ]
        [ Svg.circle [ cx "12", cy "12", r "12", fill color ] [] ]
