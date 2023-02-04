module Data exposing (..)

import Browser.Dom exposing (Viewport)
import Countdown.Data as Countdown
import Matrix exposing (Matrix)
import Point exposing (Pixel, Point)
import Set exposing (Set)
import Ship exposing (Ship)
import Time exposing (Posix)


type Castle
    = Castle Point


type alias Spec =
    { castles : List Castle
    , castlePoints : Set Point
    , dimensions : Point
    , ships : Int
    }


castle : Point -> Castle
castle =
    Castle


pointsFromCastles : List Castle -> Set Point
pointsFromCastles =
    List.foldr
        (\(Castle ( x, y )) s ->
            Set.fromList
                [ ( x, y )
                , ( x + 1, y )
                , ( x, y + 1 )
                , ( x + 1, y + 1 )
                ]
                |> Set.union s
        )
        Set.empty


roundOne : Spec
roundOne =
    let
        castles =
            [ castle ( 8, 30 ), castle ( 25, 5 ), castle ( 3, 8 ), castle ( 12, 12 ), castle ( 20, 20 ) ]

        points =
            pointsFromCastles castles
    in
    { castles = castles
    , castlePoints = points
    , dimensions = ( 60, 35 )
    , ships = 5
    }


defaultCastle : Point
defaultCastle =
    ( 12, 12 )


type Phase
    = Building
    | Placing
    | Battling
    | CastleSelection
    | Start


type alias Model =
    { spec : Spec
    , walls : Set Point
    , cannon : Set Point
    , availableCannon : Int
    , buildable : Set Point
    , currentShape : Maybe (Matrix Int)
    , overCell : Maybe Point
    , phase : Phase
    , countdown : Countdown.Model
    , castleSelected : Bool
    , mousePos : Maybe Point
    , viewport : Pixel
    , ships : List Ship
    , lastFrame : Maybe Int
    }


type Msg
    = CellClicked Point
    | CastleSelected Castle
    | NextShape (Matrix Int)
    | KeyDown Int
    | MouseMove Point
    | MouseOver Point
    | MouseOut
    | CountdownMsg Countdown.Msg
    | StartGame
    | BuildWall (List Point)
    | SetViewport Viewport
    | AddShip Ship
    | Frame Float
    | WallTargets (List Point)
