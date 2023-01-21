module Data exposing (..)

import Set exposing (Set)
import TestData exposing (enclosed)

-- Can't yet think of an obvious way to tell if a castle is fully enclosed or not
-- start brain dumping the sorts of things we will have
-- shapes are not quite the same as tetris - there are more of them

type alias Spec = 
    { castles: Set (Int, Int)
    , dimensions: (Int, Int)
    , ships: Int 
    -- etc
    }

roundOne : Spec 
roundOne = 
    { castles = Set.fromList [(8, 30), (25, 2), (3, 8), (12, 12), (20, 20)]
    , dimensions = (50, 35)
    , ships = 5
    }


init : Model
init =
    { spec = roundOne
    , walls = enclosed
    }


type alias Model =
    {  spec : Spec
    , walls : Set (Int, Int)
    }


type Msg
    = Increment
    | Decrement


type BuildingBlock
    = One
    | Two
    | Three
    | Etc


type alias Position =
    ( Int, Int )


type alias Ship =
    { pos : Position
    , velocity : Float
    , direction : Direction
    }


type alias Direction =
    ( Float, Float )


type alias Cannonball =
    { pos : Position
    , velocity : Float
    , direction : Direction
    , target : Position
    }


type alias Castle =
    { pos : Position
    , enclosed : Bool
    , canon : List Cannon
    }


type alias Player =
    { castles : List Castle
    }


type alias Cannon =
    { pos : Position }


type Game
    = NotPlaying
    | Playing


type Round
    = Building
    | Battling
    | PlacingCannon
