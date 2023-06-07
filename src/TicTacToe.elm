module TicTacToe exposing (init, main, update, view)

import Browser
import Element
import Html exposing (div, text)
import Html.Attributes exposing (style)


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


view model =
    Element.layout []
