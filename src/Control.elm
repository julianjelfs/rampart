module Control exposing (..)

import Data exposing (Model, Msg(..), roundOne)
import FloodFill exposing (findBuildableCells)
import Set exposing (Set)
import TestData exposing (enclosed)


init : Model
init =
    let
        cannon =
            Set.fromList [ ( 2, 6 ), ( 3, 6 ), ( 4, 6 ) ]
    in
    { spec = roundOne
    , walls = enclosed
    , cannon = cannon
    , buildable = findBuildableCells roundOne enclosed cannon
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        CellClicked cell ->
            let
                walls =
                    if Set.member cell model.walls then
                        Set.remove cell model.walls

                    else
                        Set.insert cell model.walls
            in
            { model
                | walls = walls
                , buildable = findBuildableCells model.spec walls model.cannon
            }
