module A_Functions exposing (init, main, update, view)

import Browser
import Commons


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Nothing


update msg model =
    model


{-| a simple function
-}
sum a b =
    a + b


{-| a partially applied function
-}
sum5 =
    sum 5


{-| we can declare types
-}
concat : String -> String -> String
concat a b =
    a ++ b


{-| even operators are functions!
-}
multiply a b =
    (*) a b


view model =
    Commons.viewPage "It's All About Functions"
        [ Commons.viewTitle "Function call:"
        , Commons.viewValue "sum 1 2 == " (sum 1 2)
        , Commons.viewTitle "Partial Application:"
        , Commons.viewValue "sum 1 == " (sum 1)

        -- HERE try to call all the defined functions
        -- HERE try to use the function sum5
        ]
