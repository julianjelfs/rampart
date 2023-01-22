module Main exposing (..)

import Browser
import Control exposing (init, update)
import Data exposing (Model, Msg(..))
import View exposing (view)


main : Program () Model Msg
main =
    Browser.sandbox { init = init, update = update, view = view }
