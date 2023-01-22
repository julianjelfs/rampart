module FloodFill exposing (..)

import Data exposing (Point, Spec)
import Set exposing (Set)


findBuildableCells : Spec -> Set Point -> Set Point -> Set Point
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


findBuildableCellsWithinCastleWalls : Spec -> Set Point -> Set Point -> Point -> Set Point
findBuildableCellsWithinCastleWalls spec walls cannon castle =
    processCell spec walls cannon castle Set.empty


findEnclosedCastles : Spec -> Set Point -> Set Point -> Set Point
findEnclosedCastles spec walls cannon =
    Set.diff spec.castles (processCell spec walls cannon ( -1, -1 ) Set.empty)


processCell : Spec -> Set Point -> Set Point -> Point -> Set Point -> Set Point
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


cellIsValid : Spec -> Set Point -> Set Point -> Set Point -> Point -> Bool
cellIsValid spec visited walls cannon cell =
    isInbounds spec.dimensions cell && notVisited visited cell && unoccupied walls cannon cell


isInbounds : Point -> Point -> Bool
isInbounds ( cols, rows ) ( x, y ) =
    x
        >= -1
        && y
        >= -1
        && x
        <= cols
        && y
        <= rows


notVisited : Set Point -> Point -> Bool
notVisited visited cell =
    not (Set.member cell visited)


unoccupied : Set Point -> Set Point -> Point -> Bool
unoccupied walls cannon cell =
    not (Set.member cell walls)
        && not (Set.member cell cannon)
