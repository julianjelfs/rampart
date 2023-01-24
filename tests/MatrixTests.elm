module MatrixTests exposing (..)

import Data exposing (Point, Spec, roundOne)
import Expect exposing (Expectation)
import Matrix exposing (Matrix)
import Set exposing (Set)
import Shapes exposing (..)
import Test exposing (..)


cornerShapeRotated =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


cshapeRotated =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 1, 0, 1 ]
        ]


sshapeRotated =
    Matrix.fromLists
        [ [ 1, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 0, 1 ]
        ]


sshapeFlippedRotated =
    Matrix.fromLists
        [ [ 0, 0, 1 ]
        , [ 1, 1, 1 ]
        , [ 1, 0, 0 ]
        ]


lshapeRotated =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 0, 1 ]
        ]


lshapeFlippedRotated =
    Matrix.fromLists
        [ [ 0, 0, 1 ]
        , [ 1, 1, 1 ]
        , [ 0, 0, 0 ]
        ]


crossshapeRotated =
    Matrix.fromLists
        [ [ 0, 1, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 1, 0 ]
        ]


barRotated =
    Matrix.fromLists
        [ [ 0, 1, 0 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


tshapeRotated =
    Matrix.fromLists
        [ [ 0, 1, 0 ]
        , [ 1, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


zigRotated =
    Matrix.fromLists
        [ [ 0, 1, 0 ]
        , [ 0, 1, 1 ]
        , [ 0, 0, 1 ]
        ]


zagRotated =
    Matrix.fromLists
        [ [ 0, 0, 1 ]
        , [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        ]


pretty =
    Matrix.pretty String.fromInt


testRotation name before after =
    test (name ++ " rotate 90%") <|
        \_ ->
            Maybe.map rotate90 before
                |> Maybe.map2 (\r res -> Expect.equal r res) after
                |> Maybe.withDefault (Expect.fail ("didn't get the right rotation for " ++ name))


footprintTests : Test
footprintTests =
    describe "translate a shape and a center point into a set of points"
        [ test "zag rotated" <|
            \_ ->
                Maybe.map
                    (\m ->
                        Expect.equal (Set.fromList [ ( 4, 6 ), ( 5, 5 ), ( 6, 5 ), ( 5, 6 ) ]) (cellsOccupiedByShape ( 5, 5 ) m)
                    )
                    zagRotated
                    |> Maybe.withDefault (Expect.fail "Wrong result")
        , test "is adjacent" <|
            \_ ->
                Expect.equal True (isAdjacent ( 5, 5 ) ( 4, 5 ))
        ]


overlapTests : Test
overlapTests =
    describe "overlaps logic"
        [ test "get does what I think it does" <|
            \_ ->
                let
                    m =
                        Matrix.repeat 3 3 5
                in
                Expect.equal (Just 5) (Matrix.get 1 1 m)
        ]


matrixTests : Test
matrixTests =
    describe "Playing with matrix rotations"
        [ testRotation "lshape" lshape lshapeRotated
        , testRotation "lshapeFlipped" lshapeFlipped lshapeFlippedRotated
        , testRotation "sshape" sshape sshapeRotated
        , testRotation "sshapeFlipped" sshapeFlipped sshapeFlippedRotated
        , testRotation "cornerShape" cornerShape cornerShapeRotated
        , testRotation "cshape" cshape cshapeRotated
        , testRotation "crossshape" crossshape crossshapeRotated
        , testRotation "bar" bar barRotated
        , testRotation "tshape" tshape tshapeRotated
        , testRotation "zig" zig zigRotated
        , testRotation "zag" zag zagRotated
        ]
