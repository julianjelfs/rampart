module FloodFillTests exposing (..)

import Data exposing (Spec, roundOne)
import Expect exposing (Expectation)
import FloodFill exposing (findEnclosedCastles, isInbounds, notVisited)
import Fuzz exposing (Fuzzer, int, list, string)
import Set exposing (Set)
import Test exposing (..)
import TestData exposing (enclosed)


testSpec : Spec
testSpec =
    { castles = Set.fromList [ ( 2, 2 ) ]
    , dimensions = ( 10, 10 )
    , ships = 5
    }


testWalls : Set ( Int, Int )
testWalls =
    Set.fromList
        [ ( 0, 0 )
        , ( 1, 0 )
        , ( 2, 0 )
        , ( 3, 0 )
        , ( 4, 0 )
        , ( 4, 1 )
        , ( 4, 2 )
        , ( 4, 3 )
        , ( 4, 4 )
        , ( 3, 4 )
        , ( 2, 4 )
        , ( 1, 4 )
        , ( 0, 4 )
        , ( 0, 3 )
        , ( 0, 2 )
        , ( 0, 1 )
        ]


floodFill : Test
floodFill =
    describe "The floodfill algorithm"
        [ test "finds one enclosed castle at (3,8)" <|
            \_ -> Expect.equal (Set.fromList [ ( 3, 8 ) ]) (findEnclosedCastles roundOne enclosed)
        , test "finds no enclosed castles" <|
            \_ -> Expect.equal Set.empty (findEnclosedCastles testSpec Set.empty)
        , test "finds enclosed castle at (2,2)" <|
            \_ -> Expect.equal (Set.fromList [ ( 2, 2 ) ]) (findEnclosedCastles testSpec testWalls)
        , test "is inbounds one" <|
            \_ ->
                Expect.equal
                    True
                    (isInbounds ( 10, 10 ) ( 5, 5 ))
        , test "is inbounds two" <|
            \_ ->
                Expect.equal
                    True
                    (isInbounds ( 10, 10 ) ( -1, -1 ))
        , test "is inbounds three" <|
            \_ ->
                Expect.equal
                    True
                    (isInbounds ( 10, 10 ) ( 10, 10 ))
        , test "is out of bounds one" <|
            \_ ->
                Expect.equal
                    False
                    (isInbounds ( 10, 10 ) ( -2, 5 ))
        , test "is out of bounds two" <|
            \_ ->
                Expect.equal
                    False
                    (isInbounds ( 10, 10 ) ( 11, 5 ))
        , test "is not visited" <|
            \_ ->
                Expect.equal
                    True
                    (notVisited (Set.fromList [ ( 0, 0 ), ( 5, 5 ) ]) ( 6, 7 ))
        , test "is visited" <|
            \_ ->
                Expect.equal
                    False
                    (notVisited (Set.fromList [ ( 0, 0 ), ( 5, 5 ) ]) ( 5, 5 ))
        ]
