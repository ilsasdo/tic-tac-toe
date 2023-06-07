module B_PipeOperator exposing (init, main, update, view)

import Browser
import Commons


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    -- a simple list
    [ 11, 20, 31, 40, 51 ]


update msg model =
    model


filterValues list =
    list
        |> List.filter isEven
        -- HERE: multiply each results by 3 (Hint: use List.map)
        |> List.filter (lessThan 30)


isEven a =
    remainderBy 2 a == 0


{-| remember: last argument is the one we are working on!
this allows us to work with pipes
-}
lessThan n x =
    x < n


view model =
    Commons.viewPage "Pipes FTW"
        [ Commons.viewValue "List values:" model
        , Commons.viewValue "List filtered:" (filterValues model)
        ]
