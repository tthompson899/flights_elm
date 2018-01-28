module Views exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..) --class, title, id, style
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
    
h3Style: List ( String, String )
h3Style = 
    [ ("margin-right", "45px")
    , ("margin-top" , "10px")
    
    ]


topHeadingStyle : List ( String, String )
topHeadingStyle = 
    [ ("background-color", "#4D4D4D")
    , ("color", "#FEFEFE")
    , ("height", "90px")
    , ("margin", "0")
    , ("padding-left", "40px")
    , ("padding-top", "12px")
    , ("margin-bottom", "51px")
    ]
    
fullWidthStyle : List ( String, String )
fullWidthStyle =
    [ ( "width", "10%" )
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
        table [ class "bordered" ]
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
--         comment out so I can test adding stuff to table arrivals
                [ tr []
                    [ td [] [ text "some stuff" ]]
                
                ]
            ]
        

view : Model -> Html Msg
view model =
        div []
            [ div [class "topPageStyle", style topHeadingStyle]
                [ img [src "../assets/img/send_icon.png", style [ ("height", "50px"), ("width", "50px")]] [ ]
                ,  h3 [ style [("display", "inline-block"), ("margin-top", "10px")]] [ (text "Flight Tracker") ]  
                ,  h3 [ class "right", style h3Style] [( text "| DFW" )]
                ]
--                , arrivalsView model
--                div [ style [("border-color", "green")]]
--                [ div []
--                    
--                ]
                
            ]
              
