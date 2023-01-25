module Main exposing (..)

import Browser
import Control exposing (init, subscriptions, update)
import Data exposing (Model, Msg(..))
import View exposing (view)


main : Program () Model Msg
main =
    Browser.element
        { init = \_ -> init
        , update = update
        , view = view
        , subscriptions = subscriptions
        }
