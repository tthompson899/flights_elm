module Models exposing (..)

import Dict exposing (Dict)
import Time as Time
import Date exposing (Date)


type alias HttpResult =
    { code : Int, message : String }


type alias FlightData =
    { status: String
    , recordType: String
    , origin: String
    , id: String
    , flightNumber: String
    , airline: String
    , estimatedArrivalTime: Int
    , destination: String
    , arrivalTime: Int
    , departureTime: Int 
    , cancelled: Bool
    , arrivalDelay: Int
    , aircraft : String
    }



type alias Model =
    { flights : Dict String FlightData
    , selected : Maybe String
    , filter : Maybe String
    }
    
