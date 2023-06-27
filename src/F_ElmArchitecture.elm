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
    Views.page "The Elm Architecture"
        [ Views.image "https://raw.githubusercontent.com/ilsasdo/tic-tac-toe/e1c939d58885d8efb29323c44d799725823156d1/assets/elm-architecture.jpg" "The Elm Architecture, illustration by Kolja Wilcke, licensed under CC BY 4.0."
        , Views.example "Counter:" model.counter
        , Views.button "Click Me!" Increment

        {- ESERCIZIO:
           Aggiungi un nuovo pulsante che Decrementa di un valore n
        -}
        ]
