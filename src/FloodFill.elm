module FloodFill exposing (..)

import Set exposing (Set)
import Data exposing (Spec)

findEnclosedCastles: Spec -> Set (Int, Int) -> Set (Int, Int)
findEnclosedCastles spec walls =
    spec.castles