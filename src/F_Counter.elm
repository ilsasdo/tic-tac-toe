module F_Counter exposing (init, main, update, view)

import Browser
import Html exposing (Html)
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { counter : Int }


type Msg
    = Increment


init =
    Model 0


update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }


view : Model -> Html Msg
view model =
    Views.viewPage "Elm Architecture"
        [ Views.viewValue "Counter:" model.counter
        , Views.viewButton "Click Me!" Increment
        ]
