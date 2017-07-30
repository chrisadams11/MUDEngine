module FirstScene.Update.ViewLogic exposing (..)


import Utility exposing (..)
import FirstScene.Model.ViewModels exposing (..)
import FirstScene.Model.GameModels exposing (..)
import FirstScene.Model.InputModels exposing (..)
import Sprite exposing (..)


updateDrawState : GameState -> InputState -> DrawState -> DrawState
updateDrawState gameState inputState drawState =
    drawState