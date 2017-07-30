module FirstScene.Update.GameLogic exposing (..)

import FirstScene.Model.InputModels exposing (..)
import FirstScene.Model.GameModels exposing (..)
import Utility exposing (..)


updateGameState : InputState -> GameState -> GameState
updateGameState inputState gameState =
    gameState
