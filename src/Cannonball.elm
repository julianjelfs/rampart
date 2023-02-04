module Cannonball exposing (..)


type alias Cannonball =
    { source : ( Float, Float )
    , target : ( Int, Int )
    , pos : ( Float, Float )
    }


createCannonball : ( Float, Float ) -> ( Int, Int ) -> Cannonball
createCannonball ship wall =
    { source = ship
    , target = wall
    , pos = ship
    }
