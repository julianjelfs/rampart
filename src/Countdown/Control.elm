module Countdown.Control exposing (..)

import Countdown.Data exposing (Model(..), Msg(..))
import Process
import Task
import Time exposing (Posix)


init : Model
init =
    Idle


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


update : Msg -> Model -> ( Model, Bool )
update msg model =
    case ( model, msg ) of
        ( Idle, _ ) ->
            ( model, True )

        ( Intro l s n, msg_ ) ->
            case msg_ of
                FinishIntro ->
                    ( CountingDown l n, False )

                _ ->
                    ( Intro l s n, False )

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

        Intro _ _ _ ->
            Sub.none

        _ ->
            Time.every 1000 Tick
