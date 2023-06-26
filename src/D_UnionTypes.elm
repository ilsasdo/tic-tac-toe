module D_UnionTypes exposing (init, main, update, view)

import Browser
import Html exposing (div, text)
import Html.Attributes exposing (style)
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


{-| Un Tipo ha delle Varianti
-}
type GameStatus
    = Waiting
    | Playing


{-| Una Variante può trasportare informazioni
-}
type User
    = LoggedIn String
    | Anonymous


{-| Un Tipo può essere associato a tipi generici
-}
type Result a e
    = Ok a
    | Error e


init =
    Waiting


update msg model =
    model


view model =
    Views.page "Types"
        [ Views.example "GameStatus:" Playing
        , Views.title "Types with informations"
        , Views.example "LoggedIn \"Mario\" ==" (userToString (LoggedIn "Mario"))
        , Views.title "Variants with different Types:"
        , Views.example "Ok \"Tutto Bene\" ==" (Ok "Tutto Bene")
        , Views.example "Error 404 ==" (Error 404)

        {-
           ESERCIZIO:
           Cosa succede se aggiungi la variant Admin al tipo User?
        -}
        ]


userToString user =
    case user of
        Anonymous ->
            "Anonymous User"

        LoggedIn username ->
            "User Logged in: " ++ username
