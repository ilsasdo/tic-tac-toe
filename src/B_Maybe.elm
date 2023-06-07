module B_Maybe exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Just "my value"


update msg model =
    model


view model =
    Views.viewPage "Call Me Maybe"
        [ Views.viewValue "Maybe:" model
        , Views.viewValue "maybeToString:" (maybeToString Nothing)

        -- HERE: try to render the model
        ]


maybeToString maybe =
    if maybe == Nothing then
        "Nothing"
