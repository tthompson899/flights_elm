port module Ports exposing (..)


port ssePortRequest : String -> Cmd msg


port ssePortEvent : (String -> msg) -> Sub msg
