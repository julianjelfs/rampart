module Data exposing (..)

import Browser.Dom exposing (Viewport)
import Cannonball exposing (Cannonball)
import Countdown.Data as Countdown
import Dict exposing (Dict)
import Matrix exposing (Matrix)
import Position exposing (Cell, Pixel)
import Set exposing (Set)
import Ship exposing (Ship)
import Time exposing (Posix)


type Castle
    = Castle Cell


type Phase
    = Building
    | Placing
    | Battling
    | CastleSelection
    | Interstitial Phase
    | GameOver
    | Start


type alias Spec =
    { castles : List Castle
    , castlePoints : Set Cell
    , dimensions : Cell
    , ships : Int
    }


castle : Cell -> Castle
castle =
    Castle


pointsFromCastles : List Castle -> Set Cell
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


defaultCastle : Cell
defaultCastle =
    ( 12, 12 )


type alias Model =
    { spec : Spec
    , walls : Set Cell
    , cannon : Set Cell
    , cannonballs : Dict Cell Cannonball
    , availableCannon : Int
    , buildable : Set Cell
    , currentShape : Maybe (Matrix Int)
    , overCell : Maybe Cell
    , phase : Phase
    , countdown : Countdown.Model
    , castleSelected : Bool
    , mousePos : Maybe Cell
    , viewport : Pixel
    , ships : List Ship
    , toPixel : Cell -> Pixel
    , toCell : Pixel -> Cell
    }


type Msg
    = CellClicked Cell
    | CastleSelected Castle
    | NextShape (Matrix Int)
    | KeyDown Int
    | MouseMove Cell
    | MouseOver Cell
    | MouseOut
    | CountdownMsg Countdown.Msg
    | StartGame
    | BuildWall (List Cell)
    | SetViewport Viewport
    | AddShip Ship
    | Frame Float
    | WallTargets (List Pixel)
