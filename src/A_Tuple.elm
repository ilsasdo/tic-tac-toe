module A_Tuple exposing (init, main, update, view)

import Browser
import Commons


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    -- HERE: try to change tuple values
    -- HERE: you can also use the syntax ("a", "b") to instance a Tuple
    Tuple.pair "a" "b"


update msg model =
    model


view model =
    Commons.viewPage "Tupla"
        [ Commons.viewValue "Tupla:" model
        , Commons.viewValue "Tuple.first:" (Tuple.first model)

        -- HERE: try to add Tuple.second
        ]
