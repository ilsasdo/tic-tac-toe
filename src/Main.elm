module Main exposing (init, main, update, view)

import Browser
import Html exposing (div, text)


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


view model =
    div [] [ text "Hello World!"]
