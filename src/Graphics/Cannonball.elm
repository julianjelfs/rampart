module Graphics.Cannonball exposing (cannonball)

import Cannonball exposing (CannonballType(..))
import Svg exposing (..)
import Svg.Attributes as SA exposing (..)


cannonball ballType ( x_, y_ ) =
    let
        color =
            case ballType of
                Normal ->
                    "#000000"

                Fire ->
                    "red"
    in
    svg [ class "cannonball", width "15", height "15", x (String.fromFloat x_), y (String.fromFloat y_), viewBox "0 0 24 24" ]
        [ Svg.circle [ cx "12", cy "12", r "12", fill color ] [] ]
