module View exposing (..)

import FirstScene.FirstScene exposing (..)
import Model exposing (..)
import Update exposing (..)
import Html exposing (Html)


view : Model -> Html Msg
view model =
    case model of
        First firstModel ->
            drawFirstScene firstModel |> (Html.map (\msg -> FirstMsg msg))
