module Model exposing (..)

import FirstScene.FirstScene exposing (..)


type Model
    = First FirstModel


initModel : Model
initModel =
    First initFirstModel
