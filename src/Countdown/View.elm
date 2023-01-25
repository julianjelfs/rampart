module Countdown.View exposing (view)

import Countdown.Data exposing (Model(..), Msg)
import Html exposing (..)
import Html.Attributes exposing (class)


view : Model -> Html Msg
view model =
    case model of
        Idle ->
            text ""

        CountingDown n ->
            div [ class "countdown" ] [ text <| String.fromInt n ]
