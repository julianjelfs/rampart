module Countdown.View exposing (view)

import Countdown.Data exposing (Model, Msg)
import Html exposing (..)
import Html.Attributes exposing (class)


view : Model -> Html Msg
view { remaining } =
    div [ class "countdown" ] [ text <| String.fromInt remaining ]
