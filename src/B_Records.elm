module B_Records exposing (init, main, update, view)

import Browser
import Html exposing (div, text)
import Html.Attributes exposing (style)


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


view model =
    div
        [ style "background" "white"
        , style "font-family" "monospace"
        , style "font-size" "24pt"
        ]
        [ text "Hello World!" ]
