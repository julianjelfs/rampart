module Countdown.View exposing (view)

import Countdown.Data exposing (Model(..), Msg)
import Html exposing (..)
import Html.Attributes exposing (class)


view : Model -> Html Msg
view model =
    case model of
        Idle ->
            text ""

        CountingDown l n ->
            div [ class "countdown" ]
                [ div [ class "countdown__title" ] [ text l ]
                , div [ class "countdown__time" ] [ text <| String.fromInt n ]
                ]
