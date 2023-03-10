module Countdown.Data exposing (..)

import Time exposing (Posix)


type Model
    = Idle
    | Intro String String Int
    | CountingDown String Int


type Msg
    = Tick Posix
    | FinishIntro
    | Stop


type CountdownResult
    = IntroComplete
    | CountdownComplete
    | NoResult
