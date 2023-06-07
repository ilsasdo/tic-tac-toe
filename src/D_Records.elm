module D_Records exposing (init, main, update, view)

import Browser
import Html exposing (div, text)
import Html.Attributes exposing (style)
import Views


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
    Views.viewPage "Records"
        [ Views.viewTitle "Default Constructor:"
        , Views.viewValue "Person \"zoe\" \"lee\" ==" (Person "zoe" "lee")
        , Views.viewTitle "Default getters:"
        , Views.viewValue ".name model ==" (.name model)
        , Views.viewTitle "Update a record:"
        , Views.viewValue "{ model | name = \"Luigi\" } ==" { model | name = "Luigi" }

        -- HERE: is model changed after the update?
        -- HERE: try to update multiple fields. Hint: separate values with ,
        -- HERE: what if you don't fill all arguments to Person?
        ]
