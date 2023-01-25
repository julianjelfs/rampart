module Countdown.Control exposing (..)

import Countdown.Data exposing (Model(..), Msg(..))
import Time exposing (Posix)


init : Model
init =
    Idle


start : String -> Int -> Model
start label time =
    CountingDown label time


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case ( model, msg ) of
        ( Idle, _ ) ->
            ( model, True )

        ( CountingDown l n, Tick _ ) ->
            if n > 0 then
                ( CountingDown l (n - 1), False )

            else
                ( Idle, True )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Idle ->
            Sub.none

        CountingDown _ _ ->
            Time.every 1000 Tick
