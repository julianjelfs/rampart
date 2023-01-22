module Shapes exposing (..)

import Matrix exposing (Matrix)


cornerShape : Maybe (Matrix Int)
cornerShape =
    Matrix.fromLists
        [ [ 1, 1 ]
        , [ 1, 0 ]
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
