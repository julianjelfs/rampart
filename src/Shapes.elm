module Shapes exposing (..)

import Matrix exposing (Matrix)


cornerShape : Maybe (Matrix Int)
cornerShape =
    Matrix.fromLists
        [ [ 1, 1 ]
        , [ 1, 0 ]
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
        [ [ 0, 0, 1, 1, 0 ]
        , [ 0, 0, 1, 0, 0 ]
        , [ 0, 0, 1, 0, 0 ]
        , [ 0, 0, 1, 0, 0 ]
        , [ 0, 1, 1, 0, 0 ]
        ]


lshape : Maybe (Matrix Int)
lshape =
    Matrix.fromLists
        [ [ 0, 1, 1 ]
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
