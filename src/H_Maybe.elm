module H_Maybe exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


view model =
    Views.page "Call Me Maybe"
        [ Views.example "Un valore:" (Just "Valore")
        , Views.example "Nothing:" Nothing
        , Views.example "maybeToString:" (maybeToString Nothing)
        ]



{- ESERCIZIO:
   Prova a ottenere l'elemento i-esimo da un Array:
   Array.fromList ["a", "b", "c", "d" ]
   Hint: Array.get <https://package.elm-lang.org/packages/elm/core/latest/Array#get>
-}


maybeToString maybe =
    case maybe of
        Nothing ->
            "Nothing"
