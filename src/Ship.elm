module Ship exposing (..)

import Random exposing (Generator)


type ShipType
    = NormalShip
    | FireShip


type alias Ship =
    { damage : Float
    , pos : ( Float, Float )
    , shipType : ShipType
    , vector : ( Float, Float )
    , velocity : Float
    }


shipAngle : ( Float, Float ) -> Float
shipAngle ( x, y ) =
    atan2 y x |> radiansToDegrees


radiansToDegrees : Float -> Float
radiansToDegrees rad =
    rad * (180 / pi)


moveShips : ( Float, Float ) -> Float -> List Ship -> List Ship
moveShips vp delta =
    List.map (moveShip vp delta)


moveShip : ( Float, Float ) -> Float -> Ship -> Ship
moveShip ( width, height ) delta ship =
    let
        { pos, vector, velocity } =
            ship

        ( x, y ) =
            pos

        ( vx, vy ) =
            vector

        x_ =
            x + delta * vx * velocity |> clamp (width / 2) width

        y_ =
            y + delta * vy * velocity |> clamp 0 height
    in
    { ship | pos = ( x_, y_ ) }


getRandomShip : ( Float, Float ) -> (Ship -> msg) -> Cmd msg
getRandomShip viewport msg =
    Random.generate msg (randomShipGenerator viewport)


randomShipGenerator : ( Float, Float ) -> Generator Ship
randomShipGenerator vp =
    Random.map4 (Ship 0) (positionGenerator vp) shipTypeGenerator vectorGenerator velocityGenerator


positionGenerator : ( Float, Float ) -> Generator ( Float, Float )
positionGenerator ( width, height ) =
    Random.pair (Random.float (width * 0.75) width) (Random.float 0 height)


shipTypeGenerator : Generator ShipType
shipTypeGenerator =
    Random.weighted ( 10, FireShip ) [ ( 90, NormalShip ) ]


vectorGenerator : Generator ( Float, Float )
vectorGenerator =
    Random.pair
        (Random.weighted ( 50, -1 ) [ ( 50, 0 ) ])
        (Random.weighted ( 33, -1 ) [ ( 33, 0 ), ( 33, 1 ) ])


velocityGenerator : Generator Float
velocityGenerator =
    Random.float 0 0.05
