module G_Composition exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


{-| Possiamo concatenare due funzioni con gli operatori (>>) e (<<)
ottenendo così una terza funzione.
(>>): (a -> b) -> (b -> c) -> (a -> c)
(<<): (b -> c) -> (a -> b) -> (a -> c)
-}
filterValues list =
    list
        |> List.filter (not << isEven)
        |> List.filter (lessThan 30)


isEven a =
    remainderBy 2 a == 0


lessThan n x =
    x < n


view model =
    Views.page "Function Composition"
        [ Views.title "Concatena due funzioni in una"
        , Views.example "List values:" [ 11, 22, 33, 44 ]
        , Views.example "List filtered:" (filterValues [ 11, 22, 33, 44 ])

        {- ESERCIZIO:
           Ottieni la lista dei numeri il cui indice è pari

           Hint: Usa List.indexedMap e Tuple.pair per ottenere un elenco di tuple
           Poi usa la function composition con Tuple.first per ottenere l'indice e Tuple.second per ottenere il valore

        -}
        ]
