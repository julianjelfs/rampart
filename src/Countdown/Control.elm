module Countdown.Control exposing (..)

import Countdown.Data exposing (Model(..), Msg(..))
import Time exposing (Posix)


init : Model
init =
    Idle


start : Int -> Model
start =
    CountingDown


update : Msg -> Model -> Model
update msg model =
    case ( model, msg ) of
        ( Idle, _ ) ->
            model

        ( CountingDown n, Tick _ ) ->
            if n > 0 then
                CountingDown (n - 1)

            else
                Idle


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Idle ->
            Sub.none

        CountingDown _ ->
            Time.every 1000 Tick
