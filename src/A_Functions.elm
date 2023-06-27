module A_Functions exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


{-| Una semplice funzione
-}
sum a b =
    a + b


{-| Possiamo dichiarare i tipi richiesti dalla Funzione
-}
concat : String -> String -> String
concat a b =
    a ++ b


{-| Una funzione parzialmente applicata:
ritorna una nuova funzione che richiede l'ultimo parametro
-}
partiallyAppliedSum : Int -> (Int -> Int)
partiallyAppliedSum a =
    sum a


{-| Anche gli operatori sono funzioni
(e possono essere parzialmente applicati!)
-}
multiply a b =
    (*) a b


view model =
    Views.page "It's All About Functions"
        [ Views.title "Esecuzione di una funzione:"
        , Views.example "sum 1 2 == " (sum 1 2)
        , Views.title "Partial Application:"
        , Views.example "sum 1 == " (sum 1)

        {-
           ESERCIZIO:
           Crea una nuova funzione che faccia la sottrazione tra due numeri.
           Utilizza questa nuova funzione in modo da sottrarre 10 a tutti i numeri di una lista.

           Hint: guarda List.map -> https://package.elm-lang.org/packages/elm/core/latest/List#map

        -}
        ]
