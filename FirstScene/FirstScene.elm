module FirstScene.FirstScene exposing (..)

import FirstScene.Model.InputModels exposing (..)
import FirstScene.Model.GameModels exposing (..)
import FirstScene.Model.ViewModels exposing (..)
import FirstScene.Update.InputLogic exposing (..)
import FirstScene.Update.GameLogic exposing (..)
import FirstScene.Update.ViewLogic exposing (..)
import FirstScene.View.View exposing (..)
import Time exposing (Time)
import Utility exposing (..)
import Html exposing (Html, div)
import Keyboard


type FirstSceneTransition
    = NoTransition


type FirstSceneMsg
    = TitleBegin
    | Tick Time
    | Ignored


type alias FirstModel =
    { inputFrame : InputFrame
    , inputState : InputState
    , gameState : GameState
    , drawState : DrawState
    }


initFirstModel : FirstModel
initFirstModel =
    { inputFrame = initialInputFrame
    , inputState = initialInputState
    , gameState = initialGameState
    , drawState = initialDrawState
    }


firstSceneSubscriptions : FirstModel -> Sub FirstSceneMsg
firstSceneSubscriptions model =
    Sub.batch
        [ Time.every (33 * Time.millisecond) Tick ]


updateFirstScene : FirstSceneMsg -> FirstModel -> ( FirstModel, Cmd msg, FirstSceneTransition )
updateFirstScene msg model =
    case msg of
        -- Main game loop
        Tick time ->
            let
                cleanInputFrame = 
                    clearInputFrame model.inputFrame

                updatedInputState =
                    updateInputState model.inputFrame model.inputState

                updatedGameState =
                    updateGameState updatedInputState model.gameState

                updatedDrawState =
                    updateDrawState model.gameState model.inputState model.drawState
            in
                ( { model
                    | inputFrame = cleanInputFrame
                    , inputState = updatedInputState
                    , gameState = updatedGameState
                    , drawState = updatedDrawState
                  }
                , Cmd.none
                , NoTransition
                )

        -- Input messages

        _ ->
            ( model, Cmd.none, NoTransition )


drawFirstScene : FirstModel -> Html FirstSceneMsg
drawFirstScene model =
    draw model.drawState