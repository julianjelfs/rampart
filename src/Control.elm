module Control exposing (..)

import Data exposing (Model, Msg(..))


update : Msg -> Model -> Model
update msg model =
    case msg of
        Increment ->
            model

        Decrement ->
            model
