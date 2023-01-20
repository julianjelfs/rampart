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
grid model =
    let
        cols = List.range 0 (Tuple.first model.dimensions)
        rows = List.range 0 (Tuple.second model.dimensions)
    in
    div [ class "grid" ]
        (List.map
            (\r ->
                div 
                    [ class "grid__row"
                    ] (List.map (\c -> 
                        let 
                            castle = Set.member (c,r) model.spec.castles
                        in
                        div 
                            [ class "grid__cell"
                            , classList 
                                [("grid__cell--land", c < 30)
                                , ("grid__cell--sea", c >= 30)
                                , ("grid__cell--castle", castle)
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
