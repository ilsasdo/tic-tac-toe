module B_Records exposing (init, main, update, view)

import Browser
import Commons
import Html exposing (div, text)
import Html.Attributes exposing (style)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Person =
    -- HERE: try adding the age field
    { name : String, surname : String }


init =
    Person "Mario" "Rossi"


update msg model =
    model


view model =
    Commons.viewPage "Records, not objects!"
        [ Commons.viewValue "a record:" model
        , Commons.viewTitle "Default Constructor:"
        , Commons.viewValue "Person \"zoe\" \"lee\" == " (Person "zoe" "lee")
        , Commons.viewTitle "Default getters:"
        , Commons.viewValue ".name model == " (.name model)
        , Commons.viewTitle "Update a record:"
        , Commons.viewValue "{ model | name = \"Luigi\" } == " { model | name = "Luigi" }
        ]
