module FirstScene.View.View exposing (..)

import FirstScene.Model.ViewModels exposing (..)
import SpriteEngine exposing (..)
import Html exposing (Html)
import List exposing (..)
import Utility exposing (..)


draw : DrawState -> Html msg
draw drawState =
    drawFrame
        {x=600, y=600}
        []