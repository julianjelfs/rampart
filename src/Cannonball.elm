module Cannonball exposing (..)

import Position exposing (Pixel)


type CannonballType
    = Normal
    | Fire


type alias Cannonball =
    { source : Pixel
    , target : Pixel
    , vector : ( Float, Float )
    , pos : Pixel
    , ballType : CannonballType
    }


createCannonball : CannonballType -> Pixel -> Pixel -> Cannonball
createCannonball type_ ( x, y ) target =
    let
        ( tx, ty ) =
            target

        ( dx, dy ) =
            ( tx - x, ty - y )

        magnitude =
            sqrt <| dx * dx + dy * dy
    in
    { source = ( x, y )
    , target = target
    , pos = ( x, y )
    , vector = ( dx / magnitude, dy / magnitude )
    , ballType = type_
    }


moveCannonball : Float -> Cannonball -> Maybe Cannonball
moveCannonball delta ball =
    let
        threshold =
            5

        velocity =
            0.2

        ( tx, ty ) =
            ball.target

        ( x, y ) =
            ball.pos

        ( vx, vy ) =
            ball.vector

        x_ =
            x + delta * velocity * vx

        y_ =
            y + delta * velocity * vy

        ( dx, dy ) =
            ( abs (x_ - tx), abs (y_ - ty) )
    in
    if dx < threshold && dy < threshold then
        Nothing

    else
        Just { ball | pos = ( x_, y_ ) }
