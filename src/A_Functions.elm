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


{-| Possiamo utilizzare il costrutto "let" per definire valori intermedi
e anche funzioni visibili solo all'interno della nostra funzione
-}
letInFunction b =
    let
        a =
            4

        c =
            sum 1 b

        lambda =
            \d e -> d * e
    in
    lambda a c


view model =
    Views.page "It's All About Functions"
        [ Views.title "Esecuzione di una funzione:"
        , Views.example "sum 1 2 == " (sum 1 2)
        , Views.title "Partial Application:"
        , Views.example "sum 1 == " (sum 1)
        , Views.example "lambda 3 2 == " ((\a b -> a * b) 3 2)

        {-
           ESERCIZIO:
           Sottrai 10 a tutti i numeri di una lista usando una funzione parzialmente applicata
        -}
        --, Views.title "Raddoppia i valori della lista"
        --, Views.example "[1, 2, 3, 4]" (List.map ??? [1, 2, 3, 4])
        ]
