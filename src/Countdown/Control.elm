module Countdown.Control exposing (..)

import Countdown.Data exposing (Model, Msg(..))
import Time exposing (Posix)


init : Int -> Model
init n =
    { remaining = n }


update : Msg -> Model -> Model
update msg model =
    case msg of
        Tick _ ->
            { model | remaining = model.remaining - 1 }


subscriptions : Model -> Sub Msg
subscriptions { remaining } =
    if remaining > 0 then
        Time.every 1000 Tick

    else
        Sub.none
