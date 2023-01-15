module Data exposing (..)

-- Can't yet think of an obvious way to tell if a castle is fully enclosed or not
-- start brain dumping the sorts of things we will have
-- shapes are not quite the same as tetris - there are more of them


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
