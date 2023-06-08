module C_Functions exposing (init, main, update, view)

import Browser
import Views


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


{-| you can use 'let' to define function-scoped values and functions
-}
letInFunction b =
    let
        a =
            4

        c =
            sum 1 b

        lambda =
            \d -> \e -> d * e
    in
    lambda a c


view model =
    Views.page "It's All About Functions"
        [ Views.title "Function call:"
        , Views.example "sum 1 2 == " (sum 1 2)
        , Views.title "Partial Application:"
        , Views.example "sum 1 == " (sum 1)

        -- HERE try to call all the defined functions
        -- HERE try to use the function sum5
        ]
