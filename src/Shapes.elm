module Shapes exposing (..)

import Data exposing (Msg(..))
import List.Extra exposing (getAt)
import Matrix exposing (Matrix)
import Random exposing (Generator)


getRandomShape : Cmd Msg
getRandomShape =
    Random.generate NextShape randomShapeGenerator


randomShapeGenerator : Generator (Matrix Int)
randomShapeGenerator =
    Random.int 0 10 |> Random.map getShape


getShape : Int -> Matrix Int
getShape i =
    getAt i allShapes
        |> Maybe.withDefault (Matrix.identity 3)


allShapes : List (Matrix Int)
allShapes =
    [ cornerShape
    , zig
    , zag
    , bar
    , tshape
    , cshape
    , sshape
    , sshapeFlipped
    , lshape
    , lshapeFlipped
    , crossshape
    ]
        |> List.filterMap identity


flippedIdentity : Maybe (Matrix Int)
flippedIdentity =
    Matrix.identity 3
        |> Matrix.toLists
        |> List.map List.reverse
        |> Matrix.fromLists


rotate90 : Matrix Int -> Matrix Int
rotate90 matrix =
    Maybe.andThen
        (\id -> Matrix.dot (Matrix.transpose matrix) id)
        flippedIdentity
        |> Maybe.withDefault matrix


cornerShape : Maybe (Matrix Int)
cornerShape =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        ]


zig : Maybe (Matrix Int)
zig =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 1, 1, 0 ]
        , [ 0, 0, 0 ]
        ]


zag : Maybe (Matrix Int)
zag =
    Matrix.fromLists
        [ [ 1, 1, 0 ]
        , [ 0, 1, 1 ]
        , [ 0, 0, 0 ]
        ]


bar : Maybe (Matrix Int)
bar =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 0, 0 ]
        ]


tshape : Maybe (Matrix Int)
tshape =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 1, 0 ]
        ]


cshape : Maybe (Matrix Int)
cshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 1 ]
        ]


sshape : Maybe (Matrix Int)
sshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        , [ 1, 1, 0 ]
        ]


sshapeFlipped : Maybe (Matrix Int)
sshapeFlipped =
    Matrix.fromLists
        [ [ 1, 1, 0 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 1 ]
        ]


lshape : Maybe (Matrix Int)
lshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


lshapeFlipped : Maybe (Matrix Int)
lshapeFlipped =
    Matrix.fromLists
        [ [ 1, 1, 0 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


crossshape : Maybe (Matrix Int)
crossshape =
    Matrix.fromLists
        [ [ 0, 1, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 1, 0 ]
        ]
