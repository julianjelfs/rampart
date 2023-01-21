module FloodFill exposing (..)

import Data exposing (Spec)
import Set exposing (Set)


findEnclosedCastles : Spec -> Set ( Int, Int ) -> Set ( Int, Int )
findEnclosedCastles spec walls =
    let
        visited =
            processCell spec Set.empty walls ( -1, -1 )
    in
    Set.diff spec.castles visited


processCell : Spec -> Set ( Int, Int ) -> Set ( Int, Int ) -> ( Int, Int ) -> Set ( Int, Int )
processCell spec visited walls cell =
    if Set.member cell visited then
        visited

    else
        let
            visited_ =
                Set.insert cell visited
        in
        case getValidSiblings spec visited walls cell of
            [] ->
                visited_

            xs ->
                List.foldl
                    (\c v ->
                        Set.union v (processCell spec v walls c)
                    )
                    visited_
                    xs


getValidSiblings : Spec -> Set ( Int, Int ) -> Set ( Int, Int ) -> ( Int, Int ) -> List ( Int, Int )
getValidSiblings spec visited walls cell =
    getAdjacentCells cell |> List.filter (\c -> isInbounds spec.dimensions c && notVisited visited c && unoccupied walls c)


isInbounds : ( Int, Int ) -> ( Int, Int ) -> Bool
isInbounds ( cols, rows ) ( x, y ) =
    x
        >= -1
        && y
        >= -1
        && x
        <= cols
        && y
        <= rows


notVisited : Set ( Int, Int ) -> ( Int, Int ) -> Bool
notVisited visited cell =
    not (Set.member cell visited)


unoccupied : Set ( Int, Int ) -> ( Int, Int ) -> Bool
unoccupied walls cell =
    not (Set.member cell walls)


getAdjacentCells : ( Int, Int ) -> List ( Int, Int )
getAdjacentCells ( x, y ) =
    [ ( x - 1, y - 1 )
    , ( x, y - 1 )
    , ( x + 1, y - 1 )
    , ( x - 1, y )
    , ( x + 1, y )
    , ( x - 1, y + 1 )
    , ( x, y + 1 )
    , ( x + 1, y + 1 )
    ]
