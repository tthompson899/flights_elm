module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, title, id, style)
import Models exposing (..)
import Messages exposing (..)
--import Utility exposing (durationFormat, timeOfDay, getOrElse)
import Dict exposing (Dict)
--import Date
--import Time exposing (Time)
--import Debug exposing (log)


resetCardStyle : String -> String -> Attribute msg
resetCardStyle height margin =
    style
        [ ( "height", height )
        , ( "max-height", height )
        , ( "margin", margin )
        ]


--styleWidth width =
    --style [ ( "width", width ) ]


fullWidthStyle : List ( String, String )
fullWidthStyle =
    [ ( "width", "100%" )
    , ( "padding", "0" )
    , ( "margin", "0" )
    , ( "height", "100vh" )
    ]


mainLayout : Html Msg -> Html Msg
mainLayout content =
    div [ class "mainwrapper", style fullWidthStyle ]
        [ div [ class "container", style fullWidthStyle ]
            [ div
                [ class "content", style fullWidthStyle ]
                [ content ]
            ]
        ]


msgBox : String -> String -> String -> Html Msg
msgBox qheading tooltip qnums =
    li [ class "cell" ]
        [ div [ title tooltip ]
            [ text qheading
            ]
        , div [ class "num" ]
            [ text qnums ]
        ]


faline : FlightData -> Html Msg
faline fadata =
    tr []
    [ td [] [ text fadata.origin ]
    , td [] [ text fadata.airline ]
    , td [] [ text fadata.flightNumber ]
    , td [] [ text (toString fadata.estimatedArrivalTime) ]
    , td [] [ text fadata.status ]
    ]

arrivalsView : Model -> Html Msg
arrivalsView model =
    let
        arrivals =
            Dict.values model.flights
                -- |> List.filter (\fdata -> fdata.recordType == "arrival" || fdata.recordType == "enroute")
                |> List.map (\flight -> faline flight)

    in
        table []
            [ thead []
                [ tr []
                    [ th [] [ text "Depature City" ]
                    , th [] [ text "Airline" ]
                    , th [] [ text "Flight No" ]
                    , th [] [ text "Estimated" ]
                    , th [] [ text "Status" ]
                    ]
                ]
            , tbody []
                arrivals
            ]

view : Model -> Html Msg
view model =
    div [ ]
        [ h1 [style [("color", "red")]] [ text "Arrivals" ]
        , arrivalsView model
        ]
