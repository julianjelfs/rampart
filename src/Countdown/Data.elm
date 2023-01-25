module Countdown.Data exposing (..)

import Time exposing (Posix)


type alias Model =
    { remaining : Int }


type Msg
    = Tick Posix
