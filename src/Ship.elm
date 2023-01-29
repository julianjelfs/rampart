module Ship exposing (..)

import Browser.Dom exposing (ViewPort)
import Data exposing (Msg(..), Point)
import Random exposing (Generator)



-- a ship needs to be more than just some coordinates
-- needs a vector and a velocity
-- a type (regular or fire)
-- a damage level


getRandomShip : ViewPort -> Cmd Msg
getRandomShip viewport =
    Random.generate AddShip (randomShipGenerator viewport)


randomShipGenerator : ViewPort -> Generator ( Float, Float )
randomShipGenerator { viewport } =
    Random.pair (Random.float 0 viewport.width) (Random.float 0 viewport.height)
