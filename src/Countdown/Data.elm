module Countdown.Data exposing (..)

import Time exposing (Posix)


type Model
    = Idle
    | CountingDown String Int


type Msg
    = Tick Posix
