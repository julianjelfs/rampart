module Ship exposing (..)

import Cannonball exposing (Cannonball, createCannonball)
import List.Extra as List
import Point exposing (Pixel, Point)
import Random exposing (Generator)
import Random.Set as Random exposing (sample)
import Set exposing (Set)


cannonballThroughput : Int
cannonballThroughput =
    2000


type ShipType
    = NormalShip
    | FireShip


type alias Ship =
    { damage : Float
    , cannonball : Maybe Cannonball
    , pos : Pixel
    , shipType : ShipType
    , vector : ( Float, Float )
    , velocity : Float
    }


shipAngle : Pixel -> Float
shipAngle ( x, y ) =
    atan2 y x |> radiansToDegrees


radiansToDegrees : Float -> Float
radiansToDegrees rad =
    rad * (180 / pi)


setShipTargets : List Ship -> List Point -> List Ship
setShipTargets ships targets =
    List.filter (\ship -> ship.cannonball == Nothing) ships
        |> List.foldr
            (\s ( ships_, targets_ ) ->
                case targets_ of
                    [] ->
                        ( ships_, targets_ )

                    head :: rest ->
                        ( { s | cannonball = Just <| createCannonball s.pos head } :: ships_, rest )
            )
            ( [], targets )
        |> Tuple.first


getShipTargets : List Ship -> Set Point -> (List Point -> msg) -> Cmd msg
getShipTargets ships walls msg =
    case List.filter (\ship -> ship.cannonball == Nothing) ships of
        [] ->
            Cmd.none

        xs ->
            getTargets walls msg (List.length xs)


moveCannonballs : Set Point -> List Ship -> List Ship
moveCannonballs walls ships =
    ships


moveShips : Pixel -> Float -> List Ship -> List Ship
moveShips vp delta ships =
    let
        moved =
            List.map (moveShip vp delta) ships
    in
    moved


moveShip : Pixel -> Float -> Ship -> Ship
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
            x + delta * vx * velocity

        y_ =
            y + delta * vy * velocity

        v =
            if x_ > maxWidth || x_ < minWidth || y_ > maxHeight || y_ < minHeight then
                velocity

            else
                velocity
    in
    { ship | pos = ( clamp minWidth maxWidth x_, clamp minHeight maxHeight y_ ), velocity = v }


getTargets : Set Point -> (List Point -> msg) -> Int -> Cmd msg
getTargets walls msg n =
    Random.generate msg (targetsGenerator n walls)


targetsGenerator : Int -> Set Point -> Generator (List Point)
targetsGenerator n walls =
    Random.list n (targetGenerator walls)


targetGenerator : Set Point -> Generator Point
targetGenerator walls =
    Random.sample walls
        |> Random.map (Maybe.withDefault ( 0, 0 ))


getRandomShip : Pixel -> (Ship -> msg) -> Cmd msg
getRandomShip viewport msg =
    Random.generate msg (randomShipGenerator viewport)


randomShipGenerator : Pixel -> Generator Ship
randomShipGenerator vp =
    Random.map4 (Ship 0 Nothing) (positionGenerator vp) shipTypeGenerator vectorGenerator velocityGenerator


positionGenerator : Pixel -> Generator Pixel
positionGenerator ( width, height ) =
    Random.pair (Random.float (width * 0.75) width) (Random.float 0 height)


shipTypeGenerator : Generator ShipType
shipTypeGenerator =
    Random.weighted ( 10, FireShip ) [ ( 90, NormalShip ) ]


vectorGenerator : Generator Pixel
vectorGenerator =
    Random.pair
        (Random.weighted ( 60, -1 ) [ ( 40, 0 ) ])
        (Random.weighted ( 40, -1 ) [ ( 20, 0 ), ( 40, 1 ) ])


velocityGenerator : Generator Float
velocityGenerator =
    Random.float 0.02 0.08
