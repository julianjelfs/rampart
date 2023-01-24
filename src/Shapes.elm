module Shapes exposing (..)

import Data exposing (Msg(..), Point)
import List.Extra exposing (getAt)
import Matrix exposing (Matrix)
import Random exposing (Generator)


type alias Shape =
    Matrix Int


getRandomShape : Cmd Msg
getRandomShape =
    Random.generate NextShape randomShapeGenerator


randomShapeGenerator : Generator Shape
randomShapeGenerator =
    Random.int 0 10 |> Random.map getShape


getShape : Int -> Shape
getShape i =
    getAt i allShapes
        |> Maybe.withDefault (Matrix.identity 3)


overlapsShape : Point -> Shape -> Bool
overlapsShape ( x, y ) shape =
    (Matrix.get x y shape |> Maybe.withDefault 0) == 1


allShapes : List Shape
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


flippedIdentity : Maybe Shape
flippedIdentity =
    Matrix.identity 3
        |> Matrix.toLists
        |> List.map List.reverse
        |> Matrix.fromLists


rotate90 : Shape -> Shape
rotate90 matrix =
    Maybe.andThen
        (\id -> Matrix.dot (Matrix.transpose matrix) id)
        flippedIdentity
        |> Maybe.withDefault matrix


cornerShape : Maybe Shape
cornerShape =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        ]


zig : Maybe Shape
zig =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 1, 1, 0 ]
        , [ 0, 0, 0 ]
        ]


zag : Maybe Shape
zag =
    Matrix.fromLists
        [ [ 1, 1, 0 ]
        , [ 0, 1, 1 ]
        , [ 0, 0, 0 ]
        ]


bar : Maybe Shape
bar =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 0, 0 ]
        ]


tshape : Maybe Shape
tshape =
    Matrix.fromLists
        [ [ 0, 0, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 1, 0 ]
        ]


cshape : Maybe Shape
cshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 1 ]
        ]


sshape : Maybe Shape
sshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        , [ 1, 1, 0 ]
        ]


sshapeFlipped : Maybe Shape
sshapeFlipped =
    Matrix.fromLists
        [ [ 1, 1, 0 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 1 ]
        ]


lshape : Maybe Shape
lshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


lshapeFlipped : Maybe Shape
lshapeFlipped =
    Matrix.fromLists
        [ [ 1, 1, 0 ]
        , [ 0, 1, 0 ]
        , [ 0, 1, 0 ]
        ]


crossshape : Maybe Shape
crossshape =
    Matrix.fromLists
        [ [ 0, 1, 0 ]
        , [ 1, 1, 1 ]
        , [ 0, 1, 0 ]
        ]
