module FloodFillTests exposing (..)

import Data exposing (Point, Spec, roundOne)
import Expect exposing (Expectation)
import FloodFill exposing (findBuildableCells, findEnclosedCastles, isInbounds, notVisited)
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


testCannon : Set Point
testCannon =
    Set.fromList
        [ ( 1, 1 ), ( 1, 2 ) ]


testWalls : Set Point
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


buildable : Test
buildable =
    describe "Finding buildable cells i.e. empty cells inside enclosed walls"
        [ test "with no enclosed castles" <|
            \_ -> Expect.equal Set.empty (findBuildableCells testSpec Set.empty Set.empty)
        , test "with enclosed castle and no cannon" <|
            \_ -> Expect.equal (Set.fromList [ ( 1, 1 ), ( 1, 2 ), ( 1, 3 ), ( 2, 1 ), ( 2, 2 ), ( 2, 3 ), ( 3, 1 ), ( 3, 2 ), ( 3, 3 ) ]) (findBuildableCells testSpec testWalls Set.empty)
        , test "with enclosed castle and some cannon" <|
            \_ -> Expect.equal (Set.fromList [ ( 1, 3 ), ( 2, 1 ), ( 2, 2 ), ( 2, 3 ), ( 3, 1 ), ( 3, 2 ), ( 3, 3 ) ]) (findBuildableCells testSpec testWalls testCannon)
        ]


floodFill : Test
floodFill =
    describe "The floodfill algorithm"
        [ test "finds one enclosed castle at (3,8)" <|
            \_ -> Expect.equal (Set.fromList [ ( 3, 8 ) ]) (findEnclosedCastles roundOne enclosed Set.empty)
        , test "finds no enclosed castles" <|
            \_ -> Expect.equal Set.empty (findEnclosedCastles testSpec Set.empty Set.empty)
        , test "finds enclosed castle at (2,2)" <|
            \_ -> Expect.equal (Set.fromList [ ( 2, 2 ) ]) (findEnclosedCastles testSpec testWalls Set.empty)
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
