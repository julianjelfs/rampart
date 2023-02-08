module ShipTests exposing (..)

import Expect exposing (Expectation)
import Ship exposing (Direction(..))
import Test exposing (..)


rotationTests : Test
rotationTests =
    describe "rotating ships"
        [ test "flip vector" <|
            \_ ->
                Expect.equal ( 0, 0 ) (Ship.flipVector ( 1, 1 ) Left)
        ]
