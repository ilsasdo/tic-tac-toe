module E_Composition exposing (init, main, update, view)

import Browser
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    -- a simple list
    [ 11, 20, 31, 40, 51 ]


update msg model =
    model


filterValues list =
    list
        |> List.filter (not << isEven)
        |> List.filter (lessThan 30)


isEven a =
    remainderBy 2 a == 0


{-| remember: last argument is the one we are working on!
this allows us to work with pipes
-}
lessThan n x =
    x < n


view model =
    Views.page "Function Composition"
        [ Views.title "Turns two functions into a new one: (a -> b) -> (b -> c) -> (a -> c)"
        , Views.example "List values:" model
        , Views.example "List filtered:" (filterValues model)

        -- HERE: try to use List.indexedMap to filter only evenly indexed values
        ]
