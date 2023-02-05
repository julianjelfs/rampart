module Shapes exposing (..)

import Data exposing (Msg(..))
import List.Extra exposing (getAt)
import Matrix exposing (Matrix)
import Position exposing (Cell)
import Random exposing (Generator)
import Set exposing (Set)


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


adjacentCells : Cell -> List Cell
adjacentCells ( x, y ) =
    [ ( x - 1, y - 1 )
    , ( x - 1, y )
    , ( x - 1, y + 1 )
    , ( x, y - 1 )
    , ( x, y )
    , ( x, y + 1 )
    , ( x + 1, y - 1 )
    , ( x + 1, y )
    , ( x + 1, y + 1 )
    ]


isAdjacent : Cell -> Cell -> Bool
isAdjacent ( x1, y1 ) ( x2, y2 ) =
    abs (x1 - x2)
        <= 1
        && abs (y1 - y2)
        <= 1


subtractCell : Cell -> Cell -> Cell
subtractCell ( x1, y1 ) ( x2, y2 ) =
    ( (x1 - x2) + 2, (y1 - y2) + 2 )


cellsOccupiedByShape : Cell -> Shape -> Set Cell
cellsOccupiedByShape center shape =
    adjacentCells center
        |> List.filterMap
            (\p ->
                let
                    ( x, y ) =
                        subtractCell p center
                in
                if Matrix.get x y shape == Just 1 then
                    Just p

                else
                    Nothing
            )
        |> Set.fromList


overlapsShape : Cell -> Shape -> Bool
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
