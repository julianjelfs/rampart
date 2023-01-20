module Main exposing (..)

import Browser
import Control exposing (update)
import Data exposing (Model, Msg(..), init)
import View exposing (view)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
