module Ship exposing (..)

import Cannonball exposing (Cannonball)
import Random exposing (Generator)
import Set exposing (Set)


type ShipType
    = NormalShip
    | FireShip


type alias Ship =
    { damage : Float
    , lastFired : Int
    , pos : ( Float, Float )
    , shipType : ShipType
    , vector : ( Float, Float )
    , velocity : Float
    }



-- this is getting messy
-- let's try thinking in terms of things that need to happen on each tick
-- of the event loop
-- Each tick we will call a fn : Time -> Model -> (Model, Cmd)
-- move each ship
-- move all cannonballs towards target
-- check for collisions
-- record damage
-- destroy things if necessary
-- spawnCannonballs : (List Cannonball -> msg) -> Int -> List Ship -> Set Point -> Cmd msg
-- spawnCannonballs msg time ships walls =
--     List.foldr
--         (\ship balls ->
--             if time - ship.lastFired > 1000 then
--                 []
--             else
--                 []
--         )
--         []
--         ships


shipAngle : ( Float, Float ) -> Float
shipAngle ( x, y ) =
    atan2 y x |> radiansToDegrees


radiansToDegrees : Float -> Float
radiansToDegrees rad =
    rad * (180 / pi)


moveShips : ( Float, Float ) -> Int -> List Ship -> List Ship
moveShips vp delta =
    List.map (moveShip vp delta)


moveShip : ( Float, Float ) -> Int -> Ship -> Ship
moveShip ( width, height ) delta ship =
    let
        maxHeight =
            height - 120

        maxWidth =
            width - 120

        minHeight =
            0

        minWidth =
            width / 2

        { pos, vector, velocity } =
            ship

        ( x, y ) =
            pos

        ( vx, vy ) =
            vector

        x_ =
            x + toFloat delta * vx * velocity

        y_ =
            y + toFloat delta * vy * velocity

        v =
            if x_ > maxWidth || x_ < minWidth || y_ > maxHeight || y_ < minHeight then
                velocity

            else
                velocity
    in
    { ship | pos = ( clamp minWidth maxWidth x_, clamp minHeight maxHeight y_ ), velocity = v }


getRandomShip : ( Float, Float ) -> (Ship -> msg) -> Cmd msg
getRandomShip viewport msg =
    Random.generate msg (randomShipGenerator viewport)


randomShipGenerator : ( Float, Float ) -> Generator Ship
randomShipGenerator vp =
    Random.map4 (Ship 0 0) (positionGenerator vp) shipTypeGenerator vectorGenerator velocityGenerator


positionGenerator : ( Float, Float ) -> Generator ( Float, Float )
positionGenerator ( width, height ) =
    Random.pair (Random.float (width * 0.75) width) (Random.float 0 height)


shipTypeGenerator : Generator ShipType
shipTypeGenerator =
    Random.weighted ( 10, FireShip ) [ ( 90, NormalShip ) ]


vectorGenerator : Generator ( Float, Float )
vectorGenerator =
    Random.pair
        (Random.weighted ( 60, -1 ) [ ( 40, 0 ) ])
        (Random.weighted ( 40, -1 ) [ ( 20, 0 ), ( 40, 1 ) ])


velocityGenerator : Generator Float
velocityGenerator =
    Random.float 0.02 0.08
