module Ship exposing (..)

import Cannonball exposing (Cannonball, createCannonball)
import List.Extra as List
import Position exposing (Cell, Pixel)
import Random exposing (Generator)
import Random.Set as Random exposing (sample)
import Set exposing (Set)


type ShipType
    = Normal
    | Fire


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


setShipTargets : List Ship -> List Pixel -> List Ship
setShipTargets ships targets =
    let
        ( firing, empty ) =
            List.partition (\{ cannonball } -> cannonball /= Nothing) ships
    in
    empty
        |> List.foldr
            (\s ( ships_, targets_ ) ->
                case targets_ of
                    [] ->
                        ( ships_, targets_ )

                    head :: rest ->
                        let
                            type_ =
                                case s.shipType of
                                    Fire ->
                                        Cannonball.Fire

                                    Normal ->
                                        Cannonball.Normal
                        in
                        ( { s | cannonball = Just <| createCannonball type_ s.pos head } :: ships_, rest )
            )
            ( [], targets )
        |> Tuple.first
        |> List.append firing


getShipTargets : (Cell -> Pixel) -> List Ship -> Set Cell -> (List Pixel -> msg) -> Cmd msg
getShipTargets toPixel ships walls msg =
    case List.filter (\ship -> ship.cannonball == Nothing) ships of
        [] ->
            Cmd.none

        xs ->
            getTargets toPixel walls msg (List.length xs)


moveCannonball : Float -> Ship -> ( Ship, Maybe Pixel )
moveCannonball delta ship =
    case ship.cannonball of
        Nothing ->
            ( ship, Nothing )

        Just ball ->
            let
                moved =
                    Cannonball.moveCannonball delta ball

                destroyed =
                    case moved of
                        Nothing ->
                            Just ball.target

                        Just _ ->
                            Nothing
            in
            ( { ship | cannonball = moved }, destroyed )


moveShips : Pixel -> Float -> List Ship -> List ( Ship, Maybe Pixel )
moveShips vp delta ships =
    List.map (moveShip vp delta) ships
        |> List.map (moveCannonball delta)


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


getTargets : (Cell -> Pixel) -> Set Cell -> (List Pixel -> msg) -> Int -> Cmd msg
getTargets toPixel walls msg n =
    Random.generate msg (targetsGenerator toPixel n walls)


targetsGenerator : (Cell -> Pixel) -> Int -> Set Cell -> Generator (List Pixel)
targetsGenerator toPixel n walls =
    Random.list n (targetGenerator toPixel walls)


targetGenerator : (Cell -> Pixel) -> Set Cell -> Generator Pixel
targetGenerator toPixel walls =
    Random.sample walls
        |> Random.map (Maybe.withDefault ( 0, 0 ))
        |> Random.map toPixel


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
    Random.weighted ( 10, Fire ) [ ( 90, Normal ) ]


vectorGenerator : Generator Pixel
vectorGenerator =
    Random.pair
        (Random.weighted ( 60, -1 ) [ ( 40, 0 ) ])
        (Random.weighted ( 40, -1 ) [ ( 20, 0 ), ( 40, 1 ) ])


velocityGenerator : Generator Float
velocityGenerator =
    Random.float 0.02 0.08
