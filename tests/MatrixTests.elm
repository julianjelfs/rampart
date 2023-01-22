module MatrixTests exposing (..)

import Data exposing (Point, Spec, roundOne)
import Expect exposing (Expectation)
import Matrix exposing (Matrix)
import Shapes exposing (..)
import Test exposing (..)


cornerShapeRotated =
    Matrix.fromLists
        [ [ 1, 1 ]
        , [ 0, 1 ]
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


flippedIdentity =
    Matrix.identity >> Matrix.toLists >> List.map List.reverse >> Matrix.fromLists


testRotation name dim before after =
    test (name ++ " rotate 90%") <|
        \_ ->
            Maybe.map2 (\m i -> ( m, Matrix.transpose m, i )) before (flippedIdentity dim)
                |> Maybe.andThen
                    (\( m, t, i ) ->
                        Matrix.dot t i
                    )
                |> Maybe.map2
                    (\r res ->
                        Expect.equal r res
                    )
                    after
                |> Maybe.withDefault (Expect.fail ("didn't get the right rotation for " ++ name))


matrixTests : Test
matrixTests =
    describe "Playing with matrix rotations"
        [ testRotation "lshape" 3 lshape lshapeRotated
        , testRotation "lshapeFlipped" 3 lshapeFlipped lshapeFlippedRotated
        , testRotation "sshape" 3 sshape sshapeRotated
        , testRotation "sshapeFlipped" 3 sshapeFlipped sshapeFlippedRotated
        , testRotation "cornerShape" 2 cornerShape cornerShapeRotated
        , testRotation "cshape" 3 cshape cshapeRotated
        , testRotation "crossshape" 3 crossshape crossshapeRotated
        , testRotation "bar" 3 bar barRotated
        , testRotation "tshape" 3 tshape tshapeRotated
        , testRotation "zig" 3 zig zigRotated
        , testRotation "zag" 3 zag zagRotated
        ]
