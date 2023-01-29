module Data exposing (..)

import Countdown.Data as Countdown
import Matrix exposing (Matrix)
import Set exposing (Set)
import TestData exposing (enclosed)


type alias Spec =
    { castles : Set Point
    , dimensions : Point
    , ships : Int

    -- etc
    }


roundOne : Spec
roundOne =
    { castles = Set.fromList [ ( 8, 30 ), ( 25, 5 ), ( 3, 8 ), ( 12, 12 ), ( 20, 20 ) ]
    , dimensions = ( 60, 35 )
    , ships = 5
    }


defaultCastle : Point
defaultCastle =
    ( 12, 12 )


type alias Point =
    ( Int, Int )


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
    , base : Maybe Point
    , mousePos : Maybe ( Int, Int )
    }


type Msg
    = CellClicked Point
    | NextShape (Matrix Int)
    | KeyDown Int
    | MouseMove ( Int, Int )
    | MouseOver Point
    | MouseOut
    | CountdownMsg Countdown.Msg
    | StartGame
    | SelectBase Point
    | BuildWall (List Point)
