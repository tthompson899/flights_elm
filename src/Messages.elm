module Messages exposing (..)

import Time exposing (Time)
--import Http exposing (..)
--import Models exposing (FlightData)


type Msg
    = Tick Time
    | StatusEvent String
    | InitApp
