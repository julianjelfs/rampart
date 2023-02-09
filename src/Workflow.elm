module Workflow exposing (animate, battling, building, castleSelection, endGame, endIntro, gameOver, init, next, placing, starting)

import Countdown.Control as Countdown
import Countdown.Data as Countdown
import Data exposing (Model, Msg(..), Phase(..))


init : Phase
init =
    Start


endIntro : Phase -> Phase
endIntro phase =
    case phase of
        Interstitial nextPhase ->
            nextPhase

        _ ->
            phase


endGame : Phase
endGame =
    GameOver


animate : Phase -> Bool
animate phase =
    phase == Battling || phase == Building || phase == Interstitial Building


castleSelection : Phase -> Bool
castleSelection =
    (==) CastleSelection


starting : Phase -> Bool
starting =
    (==) Start


gameOver : Phase -> Bool
gameOver =
    (==) GameOver


battling : Phase -> Bool
battling =
    (==) Battling


placing : Phase -> Bool
placing =
    (==) Placing


building : Phase -> Bool
building =
    (==) Building


next : Model -> ( Model, Cmd Msg )
next model =
    case model.phase of
        GameOver ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.selectCastle
            in
            ( { model | phase = Interstitial CastleSelection, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        Start ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.selectCastle
            in
            ( { model | phase = Interstitial CastleSelection, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        Interstitial nextPhase ->
            ( { model | phase = nextPhase }, Cmd.none )

        CastleSelection ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.placeCannon
            in
            ( { model | phase = Interstitial Placing, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        Placing ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.prepareForBattle
            in
            ( { model | phase = Interstitial Battling, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        Battling ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.buildAndRepair
            in
            ( { model | phase = Interstitial Building, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )

        Building ->
            let
                ( countdown, countdownCmd ) =
                    Countdown.placeCannon
            in
            ( { model | phase = Interstitial Placing, countdown = countdown }, Cmd.map CountdownMsg countdownCmd )
