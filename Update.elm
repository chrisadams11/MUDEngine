module Update exposing (..)

import Model exposing (..)
import FirstScene.FirstScene exposing (..)
import Platform.Sub


type Msg
    = FirstMsg FirstSceneMsg
    | UnknownMsg


subscriptions : Model -> Sub Msg
subscriptions model =
    case model of
        First firstModel ->
            (firstSceneSubscriptions firstModel) |> (Sub.map (\sub -> FirstMsg sub))


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case model of
        First firstModel ->
            case msg of
                FirstMsg firstMsg ->
                    let
                        ( updatedFirstModel, cmd, transition ) =
                            updateFirstScene firstMsg firstModel
                    in
                        case transition of
                            _ ->
                                ( First updatedFirstModel, cmd )

                _ ->
                    ( model, Cmd.none )
