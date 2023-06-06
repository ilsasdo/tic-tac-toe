module D_Maybe exposing (init, main, update, view)

import Browser
import Commons


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Just "my value"


update msg model =
    model


view model =
    Commons.viewPage "Call Me Maybe"
        [ Commons.viewValue "Maybe:" model
        , Commons.viewValue "maybeToString:" (maybeToString model)

        -- HERE: try to render a Nothing
        ]


maybeToString maybe =
    case maybe of
        Just "my value" ->
            "my value"

        Nothing ->
            "nothing"
