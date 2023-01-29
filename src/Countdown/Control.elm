module Countdown.Control exposing (..)

import Countdown.Data exposing (Model(..), Msg(..))
import Process
import Task
import Time exposing (Posix)


init : Model
init =
    Idle


start : String -> Int -> ( Model, Cmd Msg )
start label time =
    ( Intro label time
    , Task.perform (\_ -> FinishIntro) (Process.sleep 5000)
    )


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case ( model, msg ) of
        ( Idle, _ ) ->
            ( model, True )

        ( Intro l n, msg_ ) ->
            case msg_ of
                FinishIntro ->
                    ( CountingDown l n, False )

                _ ->
                    ( Intro l n, False )

        ( CountingDown l n, msg_ ) ->
            case msg_ of
                Tick _ ->
                    if n > 0 then
                        ( CountingDown l (n - 1), False )

                    else
                        ( Idle, True )

                _ ->
                    ( CountingDown l n, False )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Idle ->
            Sub.none

        Intro _ _ ->
            Sub.none

        _ ->
            Time.every 1000 Tick
