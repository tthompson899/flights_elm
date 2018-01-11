module Main exposing (..)

import Html exposing (..)
import Dict exposing (Dict)
--import Material
import Time exposing (every, minute)
import Models exposing (..)
import Messages exposing (..)
import Views exposing (view)
import Update exposing (..)
import Ports exposing (..)


-- Entry Point


initModel : Model
initModel =
    { flights = Dict.empty
    , selected = Nothing
    , filter = Nothing
    }


entryPoint : ( Model, Cmd Msg )
entryPoint =
    ( initModel, ssePortRequest apiUrl)


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ every minute Tick
        , ssePortEvent StatusEvent
        ]


main : Program Never Model Msg
main =
    program
        { init = entryPoint
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
