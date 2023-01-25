module Countdown.Data exposing (..)

import Time exposing (Posix)


type Model
    = Idle
    | CountingDown Int


type Msg
    = Tick Posix
