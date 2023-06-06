module A_Functions exposing (init, main, update, view)

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
        , style "text-align" "center"
        , style "font-family" "monospace"
        , style "font-size" "24pt"
        ]
        [ text "Hello World!" ]
