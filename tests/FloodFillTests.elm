module FloodFillTests exposing (..)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import TestData exposing(enclosed)
import Data exposing (roundOne)
import FloodFill exposing (findEnclosedCastles)
import Set exposing (Set)

floodFill : Test
floodFill =
    describe "The floodfill algorithm"
        [ test "finds one enclosed castle at (3,8)" <|
            \_ -> Expect.equal (Set.fromList [(3,8)]) (findEnclosedCastles roundOne enclosed ) 
        ]
