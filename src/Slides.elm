module Slides exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Tuple.pair "a" "b"


update msg model =
    model


view model =
    Views.page "Tuple"
        [ Views.example "model ==" model
        , Views.example "Tuple.first model ==" (Tuple.first model)

        -- HERE: try to add Tuple.second
        ]
