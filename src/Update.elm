module Update exposing (update, apiUrl)

import Dict exposing (Dict)
import Json.Decode as Decode exposing (..)
--import Json.Encode as Encode
import Debug exposing (log)
import Http
--import Material
import Json.Decode.Pipeline exposing (decode, required, optional, hardcoded)
import Time as Time
--import Http
import Models exposing (..)
import Messages exposing (..)
import Ports exposing (..)


apiUrl : String
apiUrl =
    "http://52.14.69.94:5053/v1.0/events/sse/fa-status/81586"
request =
      Http.get apiUrl faStatusDecoder

faStatusDecoder : Decoder FlightData
faStatusDecoder =
    decode FlightData
        |> required "status" string
        |> required "record_type" string
        |> required "origin" string
        |> required "id" string
        |> required "flight_number" string
        |> required "airline" string
        |> required "estimated_arrival_time" int
        |> required "destination" string
        |> optional "arrival_time" int 0
        |> optional "depature_time" int 0
        |> required "cancelled" bool
        |> required "arrival_delay" int
        |> required "aircraft" string


updateFlightStatus : Model -> String -> Model
updateFlightStatus model payload =
    case decodeString faStatusDecoder payload of
        Ok faData ->
            { model | flights = Dict.insert faData.id faData model.flights }

        Err err ->
            log ("Failed to parse " ++ payload ++ " Error - " ++ err)
                model


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Tick time ->
            ( model, Cmd.none )
        InitApp ->
            log ("Starting SSE REquest")
            ( model, ssePortRequest apiUrl )
        StatusEvent flightDataStr ->
            (  (updateFlightStatus model flightDataStr), Cmd.none )

