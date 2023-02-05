module FloodFill exposing (..)

import Data exposing (Spec)
import Position exposing (Cell)
import Set exposing (Set)


findBuildableCells : Spec -> Set Cell -> Set Cell -> Set Cell
findBuildableCells spec walls cannon =
    let
        enclosed =
            findEnclosedCastles spec walls cannon
    in
    Set.foldl
        (\c buildable ->
            Set.union buildable (findBuildableCellsWithinCastleWalls spec walls cannon c)
        )
        Set.empty
        enclosed


findBuildableCellsWithinCastleWalls : Spec -> Set Cell -> Set Cell -> Cell -> Set Cell
findBuildableCellsWithinCastleWalls spec walls cannon castle =
    processCell spec walls cannon castle Set.empty


findEnclosedCastles : Spec -> Set Cell -> Set Cell -> Set Cell
findEnclosedCastles spec walls cannon =
    Set.diff spec.castlePoints (processCell spec walls cannon ( -1, -1 ) Set.empty)


processCell : Spec -> Set Cell -> Set Cell -> Cell -> Set Cell -> Set Cell
processCell spec walls cannon ( x, y ) visited =
    if cellIsValid spec visited walls cannon ( x, y ) then
        let
            visited_ =
                Set.insert ( x, y ) visited
        in
        processCell spec walls cannon ( x - 1, y ) visited_
            |> processCell spec walls cannon ( x + 1, y )
            |> processCell spec walls cannon ( x, y - 1 )
            |> processCell spec walls cannon ( x, y + 1 )

    else
        visited


cellIsValid : Spec -> Set Cell -> Set Cell -> Set Cell -> Cell -> Bool
cellIsValid spec visited walls cannon cell =
    isInbounds spec.dimensions cell && notVisited visited cell && unoccupied walls cannon cell


isInbounds : Cell -> Cell -> Bool
isInbounds ( cols, rows ) ( x, y ) =
    x
        >= -1
        && y
        >= -1
        && x
        <= cols
        && y
        <= rows


notVisited : Set Cell -> Cell -> Bool
notVisited visited cell =
    not (Set.member cell visited)


unoccupied : Set Cell -> Set Cell -> Cell -> Bool
unoccupied walls cannon cell =
    not (Set.member cell walls)
        && not (Set.member cell cannon)
