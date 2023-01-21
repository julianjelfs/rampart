module View exposing (..)

import Data exposing (Model, Msg(..))
import Html exposing (Html, div, text)
import Html.Attributes exposing (class, classList)
import Set 
import Graphics.Castle as Castle


view : Model -> Html Msg
view model =
    grid model


grid : Model -> Html Msg
grid { spec, walls } =
    let
        cols = List.range 0 (Tuple.first spec.dimensions)
        rows = List.range 0 (Tuple.second spec.dimensions)
    in
    div [ class "grid" ]
        (List.map
            (\r ->
                div 
                    [ class "grid__row"
                    ] (List.map (\c -> 
                        let 
                            castle = Set.member (c,r) spec.castles
                            wall = Set.member (c, r) walls
                        in
                        div 
                            [ class "grid__cell"
                            , classList 
                                [("grid__cell--land", c < 30)
                                , ("grid__cell--sea", c >= 30)
                                , ("grid__cell--castle", castle)
                                , ("grid__cell--wall", wall)
                                ]
                            ] [if castle then 
                                Castle.castle
                            
                            else
                                text ""
                            
                            ]
                    
                    ) cols)
            )
            rows
        )
