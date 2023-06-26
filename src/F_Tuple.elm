module F_Tuple exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


view model =
    Views.page "Tuple"
        [ Views.example "Tuple.pair ==" (Tuple.pair "a" "b")
        , Views.example "Tuple.first ==" (Tuple.first ( 1, 2 ))
        , Views.example "Pattern Matching ==" (patternMatching ( "Ciao", "Pluto" ))

        {-
           ESERCIZIO
              1. Prova a cambiare i valori della tupla, usando anche numeri o valori booleani
              2. Puoi anche usare la sintassi ("a", "b") per definire una Tupla
              3. Mostra il risultato della funzione Tuple.second
        -}
        ]


{-| Il Pattern Matching consente di estrarre i singoli campi dalle Tuple, dai Record, dagli Union Types
-}
patternMatching ( a, b ) =
    a ++ " " ++ b
