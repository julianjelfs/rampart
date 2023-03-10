module Countdown.Control exposing (..)

import Countdown.Data exposing (CountdownResult(..), Model(..), Msg(..))
import Process
import Task
import Time exposing (Posix)


init : Model
init =
    Idle


stop : Cmd Msg
stop =
    Task.perform (\_ -> Stop) (Task.succeed ())


placeCannon : ( Model, Cmd Msg )
placeCannon =
    start "Place your cannons" "Position inside fort walls" 10


prepareForBattle : ( Model, Cmd Msg )
prepareForBattle =
    start "Prepare for battle!" "Shoot at enemy ships" 15


selectCastle : ( Model, Cmd Msg )
selectCastle =
    start "Select your home castle" "You have 10 seconds" 10


buildAndRepair : ( Model, Cmd Msg )
buildAndRepair =
    start "Build and repair" "Surround castles, repair holes" 25


start : String -> String -> Int -> ( Model, Cmd Msg )
start label sub time =
    ( Intro label sub time
    , Task.perform (\_ -> FinishIntro) (Process.sleep 5000)
    )


update : Msg -> Model -> ( Model, CountdownResult )
update msg model =
    case ( model, msg ) of
        ( Idle, _ ) ->
            ( model, NoResult )

        ( Intro l s n, msg_ ) ->
            case msg_ of
                FinishIntro ->
                    ( CountingDown l n, IntroComplete )

                _ ->
                    ( Intro l s n, NoResult )

        ( CountingDown l n, msg_ ) ->
            case msg_ of
                Stop ->
                    ( Idle, CountdownComplete )

                Tick _ ->
                    if n > 0 then
                        ( CountingDown l (n - 1), NoResult )

                    else
                        ( Idle, CountdownComplete )

                _ ->
                    ( CountingDown l n, NoResult )


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        Idle ->
            Sub.none

        Intro _ _ _ ->
            Sub.none

        _ ->
            Time.every 1000 Tick
