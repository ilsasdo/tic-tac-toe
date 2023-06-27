module F_ElmArchitecture exposing (init, main, update, view)

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
    Views.page "Elm Architecture"
        [ Views.image ""
        , Views.title "The Elm Architecture, illustration by Kolja Wilcke, licensed under CC BY 4.0."
        , Views.example "Counter:" model.counter
        , Views.button "Click Me!" Increment

        -- HERE, To view a numbered input, use View.numberInput: label value message
        ]