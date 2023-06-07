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
    Commons.viewPage "Records"
        [ Commons.viewTitle "Default Constructor:"
        , Commons.viewValue "Person \"zoe\" \"lee\" ==" (Person "zoe" "lee")
        , Commons.viewTitle "Default getters:"
        , Commons.viewValue ".name model ==" (.name model)
        , Commons.viewTitle "Update a record:"
        , Commons.viewValue "{ model | name = \"Luigi\" } ==" { model | name = "Luigi" }

        -- HERE: is model changed after the update?
        -- HERE: try to update multiple fields. Hint: separate values with ,
        -- HERE: what if you don't fill all arguments to Person?
        ]
