module CannonballTests exposing (..)

import Cannonball exposing (..)
import Data exposing (Spec, roundOne)
import Expect exposing (Expectation, FloatingPointTolerance(..))
import Test exposing (..)
import Tuple


testCoordsTwo =
    ( ( 643, 858 ), ( 1242, 400 ) )


vertex =
    ( 942.5, 200 )


testFunctionOne : List Test
testFunctionOne =
    let
        fn =
            createParabolator ( 0, 0 ) ( 10, 0 )
    in
    [ test "at the 1/2 point" <|
        \_ ->
            Expect.within (Absolute 0.00001) -200 (fn 5)
    , test "at the 1/4 point" <|
        \_ ->
            Expect.within (Absolute 0.00001) -150 (fn 2.5)
    , test "at the 3/4 point" <|
        \_ ->
            Expect.within (Absolute 0.00001) -150 (fn 7.5)
    ]


testFunctionTwo : List Test
testFunctionTwo =
    let
        fn =
            createParabolator (Tuple.first testCoordsTwo) (Tuple.second testCoordsTwo)
    in
    [ test "at the 1/2 point" <|
        \_ ->
            Expect.within (Absolute 0.00001) 200 (fn 942.5)
    , test "at the 1/4 point" <|
        \_ ->
            Expect.within (Absolute 0.00001) 364.5 (fn 792.75)
    , test "at the 3/4 point" <|
        \_ ->
            Expect.within (Absolute 0.00001) 364.5 (fn 1092.25)
    , test "hits the target" <|
        \_ ->
            Expect.within (Absolute 0.00001) 400 (fn 1242)
    , test "starts in the right place" <|
        \_ ->
            Expect.within (Absolute 0.00001) 858 (fn 643)
    ]


simpleParabola : Test
simpleParabola =
    describe "simple parabola" testFunctionOne


realisticParabola : Test
realisticParabola =
    describe "realistic parabola" testFunctionTwo


coefficientTests : Test
coefficientTests =
    describe "calculate coefficient a"
        [ test "with realistic points" <|
            \_ -> Expect.within (Absolute 0.000001) 0.007335542 (findCoefficient (Tuple.first testCoordsTwo) vertex)
        ]
