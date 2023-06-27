module D_Records exposing (init, main, update, view)

import Browser
import Html exposing (div, text)
import Html.Attributes exposing (style)
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


{-| Possiamo definire degli alias per rendere i nostri dati più chiari
-}
type alias Age =
    Int


type alias Person =
    { name : String
    , surname : String
    }


init =
    Person "Mario" "Rossi"


update msg model =
    model


view model =
    Views.page "Records"
        [ Views.title "Default Constructor:"
        , Views.example "Person \"zoe\" \"lee\" ==" (Person "zoe" "lee")
        , Views.title "Default getters:"
        , Views.example ".name model ==" (.name model)
        , Views.title "Update a record:"
        , Views.example "{ model | name = \"Luigi\" } ==" { model | name = "Luigi" }
        ]



{- ESERCIZIO:

   1. Cosa succede se aggiungi il campo "age" al Modello?
   2. Prova a modificare due campi dello stesso Record (Hint: separa con , i campi da aggiornare)

-}
