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
    , parabola : Float -> Float
    }



-- y = a * x^2 + bx + c
-- y = a (x - vx)^2 + vy
-- seems like it *should* work but it doesn't. Might need to write some tests


findCoefficient : ( Float, Float ) -> ( Float, Float ) -> Float
findCoefficient ( sx, sy ) ( vx, vy ) =
    Debug.log "A coefficient" <| (sy - vy) / ((sx - vx) * (sx - vx))


createParabolator : Pixel -> Pixel -> (Float -> Float)
createParabolator ( sx, sy ) ( tx, ty ) =
    let
        _ =
            Debug.log "Params" ( ( sx, sy ), ( tx, ty ) )

        -- midpoint in the x coordinate
        mx =
            Debug.log "mid" <| (sx + tx) / 2

        dy =
            ty - sy

        dx =
            abs (sx - tx)

        -- this is the vertex
        ( vx, vy ) =
            Debug.log "vertex" <| ( mx, min sy ty - 200 )

        -- given the vertex, figure out the coefficient a
        fn =
            \x ->
                let
                    dx_ =
                        abs (sx - x)

                    frac =
                        dx_ / dx

                    adjust =
                        dy * frac

                    y =
                        findCoefficient ( sx, sy ) ( vx, vy ) * (x - vx) * (x - vx) + vy
                in
                Debug.log "Y value" <| y + adjust
    in
    fn


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
    , parabola = createParabolator ( x, y ) target
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

        -- y_ =
        --     y + delta * velocity * vy
        y_ =
            ball.parabola x_

        ( dx, dy ) =
            ( abs (x_ - tx), abs (y_ - ty) )
    in
    if dx < threshold && dy < threshold then
        Nothing

    else
        Just { ball | pos = ( x_, y_ ) }
