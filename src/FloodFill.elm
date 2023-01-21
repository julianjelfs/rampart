module FloodFill exposing (..)

import Data exposing (Spec)
import Set exposing (Set)


findEnclosedCastles : Spec -> Set ( Int, Int ) -> Set ( Int, Int )
findEnclosedCastles spec walls =
    let
        processCell ( x, y ) visited =
            if cellIsValid spec visited walls ( x, y ) then
                let
                    visited_ =
                        Set.insert ( x, y ) visited
                in
                processCell ( x - 1, y ) visited_
                    |> processCell ( x + 1, y )
                    |> processCell ( x, y - 1 )
                    |> processCell ( x, y + 1 )

            else
                visited
    in
    Debug.log "Result" <| Set.diff spec.castles (processCell ( -1, -1 ) Set.empty)


cellIsValid : Spec -> Set ( Int, Int ) -> Set ( Int, Int ) -> ( Int, Int ) -> Bool
cellIsValid spec visited walls cell =
    isInbounds spec.dimensions cell && notVisited visited cell && unoccupied walls cell


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
