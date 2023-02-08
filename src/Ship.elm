module Ship exposing (..)

import Cannonball exposing (Cannonball, createCannonball)
import Html exposing (time)
import List.Extra as List
import Position exposing (Cell, Pixel)
import Random exposing (Generator)
import Random.Set as Random exposing (sample)
import Set exposing (Set)


type ShipType
    = Normal
    | Fire


type Direction
    = Left
    | Right


type alias Ship =
    { damage : Float
    , cannonball : Maybe Cannonball
    , timeSinceCourseChange : Float
    , courseInterval : Float
    , changes : List Direction
    , pos : Pixel
    , shipType : ShipType
    , vector : ( Float, Float )
    , velocity : Float
    }



-- TODO this calculates the distance between the cannonball (center) and the
-- ship center and considers it a hit if the distance is less than some limit
-- which is not ideal as it doesn't account for orientation, but it'll do for now


overlapsPoint : Ship -> Pixel -> Bool
overlapsPoint { pos } ( bx, by ) =
    let
        -- half ship hitbox
        offset =
            60

        limit =
            50

        ( sx, sy ) =
            pos

        diffx =
            abs (sx + offset - bx)

        diffy =
            abs (sy + offset - by)

        distance =
            sqrt ((diffx * diffx) + (diffy * diffy))
    in
    distance < limit


shipAngle : ( Float, Float ) -> Float
shipAngle ( x, y ) =
    atan2 y x |> radiansToDegrees |> Debug.log "Angle"


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
                            ( sx, sy ) =
                                s.pos

                            type_ =
                                case s.shipType of
                                    Fire ->
                                        Cannonball.Fire

                                    Normal ->
                                        Cannonball.Normal
                        in
                        ( { s | cannonball = Just <| createCannonball type_ ( sx + 60, sy + 60 ) head } :: ships_, rest )
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


flipVector : Float -> ( Float, Float ) -> List Direction -> ( Float, Float )
flipVector v ( x, y ) changes =
    let
        rotateAnti d =
            ( cos d * x - sin d * y
            , sin d * x + cos d * y
            )

        angle =
            v * 500
    in
    case changes of
        Left :: _ ->
            rotateAnti (degrees angle)

        Right :: _ ->
            rotateAnti (degrees (360 - angle))

        _ ->
            ( x, y )


courseChange : Float -> Ship -> ( Float, ( Float, Float ), List Direction )
courseChange delta { timeSinceCourseChange, vector, velocity, courseInterval, changes } =
    if timeSinceCourseChange < courseInterval then
        ( timeSinceCourseChange + delta, vector, changes )

    else
        case changes of
            x :: xs ->
                ( 0
                , flipVector velocity vector changes
                , xs ++ [ x ]
                )

            _ ->
                ( timeSinceCourseChange + delta, vector, changes )


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

        { pos, velocity } =
            ship

        ( x, y ) =
            pos

        ( t, v, changes ) =
            courseChange delta ship

        ( vx, vy ) =
            v

        x_ =
            x + delta * vx * velocity

        y_ =
            y + delta * vy * velocity
    in
    { ship
        | pos = ( clamp minWidth maxWidth x_, clamp minHeight maxHeight y_ )
        , vector = v
        , changes = changes
        , timeSinceCourseChange = t
    }


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
    Random.constant (Ship 0 Nothing 0)
        |> apply courseIntervalGenerator
        |> apply directionGenerator
        |> apply (positionGenerator vp)
        |> apply shipTypeGenerator
        |> apply vectorGenerator
        |> apply velocityGenerator


apply : Generator a -> Generator (a -> b) -> Generator b
apply g r =
    Random.andThen (\a -> Random.map (\fn -> fn a) r) g


positionGenerator : Pixel -> Generator Pixel
positionGenerator ( width, height ) =
    Random.pair (Random.float (width * 0.75) width) (Random.float 0 height)


courseIntervalGenerator : Generator Float
courseIntervalGenerator =
    Random.float 500 2000


directionGenerator : Generator (List Direction)
directionGenerator =
    Random.list 20 <|
        Random.weighted ( 50, Left ) [ ( 50, Right ) ]


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
