module Data exposing (..)

import Set exposing (Set)
import TestData exposing (enclosed)



-- Can't yet think of an obvious way to tell if a castle is fully enclosed or not
-- start brain dumping the sorts of things we will have
-- shapes are not quite the same as tetris - there are more of them


type alias Spec =
    { castles : Set Point
    , dimensions : Point
    , ships : Int

    -- etc
    }


roundOne : Spec
roundOne =
    { castles = Set.fromList [ ( 8, 30 ), ( 25, 2 ), ( 3, 8 ), ( 12, 12 ), ( 20, 20 ) ]
    , dimensions = ( 50, 35 )
    , ships = 5
    }


type alias Point =
    ( Int, Int )


type alias Model =
    { spec : Spec
    , walls : Set Point
    , cannon : Set Point
    , buildable : Set Point
    }


type Msg
    = CellClicked Point


type BuildingBlock
    = One
    | Two
    | Three
    | Etc


type alias Ship =
    { pos : Point
    , velocity : Float
    , direction : Direction
    }


type alias Direction =
    ( Float, Float )


type alias Cannonball =
    { pos : Point
    , velocity : Float
    , direction : Direction
    , target : Point
    }


type alias Castle =
    { pos : Point
    , enclosed : Bool
    , canon : List Cannon
    }


type alias Player =
    { castles : List Castle
    }


type alias Cannon =
    { pos : Point }


type Game
    = NotPlaying
    | Playing


type Round
    = Building
    | Battling
    | PlacingCannon
