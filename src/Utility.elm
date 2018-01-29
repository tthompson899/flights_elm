module Utility exposing (..)

import Date
import Time exposing (Time)
import Dict exposing (Dict)
import Html exposing (..)
import Html.Attributes exposing (..)
import Messages exposing (..)

durationFormat : Int -> String
durationFormat duration =
    let
        ( acc, _ ) =
            List.foldl
                (\p ( a, dur ) ->
                    ( (if dur > p then
                        toString (dur // p) |> String.padLeft 2 '0'
                       else
                        "00"
                      )
                        :: a
                    , dur % p
                    )
                )
                ( [], duration // 1000 )
                [ 3600, 60, 1 ]

        upd =
            acc |> List.reverse |> String.join ":"
    in
        if String.left 3 upd == "00:" then
            String.right 5 upd
        else
            upd


timeOfDay : Int -> String
timeOfDay millis =
    let
        dd =
            Date.fromTime (toFloat millis)
    in
        [ Date.hour dd, Date.minute dd ]
            |> List.map (\n -> n |> toString |> String.padLeft 2 '0')
            |> String.join ":"


getOrElse : Dict comparable b -> comparable -> b -> b
getOrElse dict key default =
    case Dict.get key dict of
        Just v ->
            v

        Nothing ->
            default
            
--arrivalDepartStatus : Html Msg -> Html Msg
--arrivalDepartStatus status =
--        let 
--            (color, message) =
--            if status < 0  then 
--                ("green", "On Time")
----                p [ style [("color", "green")]] [text "On Time"]
--            else
--                ("red", "Delayed")
----                p [ style [("color", "red")]] [text "Delayed!"]
--        in
--            div [ style [("color", color)] ] [ text message ]