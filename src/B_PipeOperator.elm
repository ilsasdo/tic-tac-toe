module B_PipeOperator exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


trasforma_senzaPipe list =
    List.map ((*) 2) (List.filter isEven (List.filter (lessThan 30) list))


{-| Con gli operatori pipe possiamo concatenare più funzioni per ottenere un valore:
(|>): a -> (a -> b) -> b
(<|): (a -> b) -> a -> b
-}
trasforma list =
    list
        |> List.filter isEven
        |> List.filter (lessThan 30)
        |> List.map ((*) 2)


{-| La stessa operazione ma con l'operatore Left Pipe
-}
trasforma_reverse list =
    List.map ((*) 2) <|
        List.filter isEven <|
            List.filter (lessThan 30) <|
                list


isEven a =
    remainderBy 2 a == 0


{-| Può sembrare strano, ma bisogna ricordarsi che per convenzione in Elm
l'ultimo argomento è "il soggetto" della funzione.
Questo torna utile perché consente di concatenare le funzioni e semplifica la Partial Application
-}
lessThan n x =
    x < n


view model =
    Views.page "Pipes FTW"
        [ Views.example "List:" [ 1, 2, 3, 4 ]
        , Views.example "trasforma:" (trasforma [ 11, 22, 33, 44 ])
        , Views.example "trasforma_senzaPipe:" (trasforma_senzaPipe [ 11, 22, 33, 44 ])
        , Views.example "trasforma_reverse:" (trasforma_reverse [ 11, 22, 33, 44 ])

        {- ESERCIZIO:
           Modifica la funzione "trasforma" così da ottenere True se la somma
           dei valori è dispari e False altrimenti

           Hint: usa List.foldl ( <https://package.elm-lang.org/packages/elm/core/latest/List#foldl> )

        -}
        ]
