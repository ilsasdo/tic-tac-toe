module E_CustomTypes exposing (init, main, update, view)

import Browser
import Html exposing (div, text)
import Html.Attributes exposing (style)
import Views


main =
    Browser.sandbox { init = init, update = update, view = view }


{-| A Type has Variants
-}
type GameStatus
    = Waiting
    | Playing
    | GameOver


{-| A Variant can carry informations
-}
type Player
    = Winner String
    | Loser


{-| Types can have generic types
-}
type Movie episode
    = IndianaJones episode
      -- HERE: what if you add a new Variant?
    | StarWars episode


init =
    Waiting


update msg model =
    model


view model =
    Views.viewPage "Types"
        [ Views.viewValue "GameStatus:" Playing
        , Views.viewTitle "Types with informations"
        , Views.viewValue "Winner \"Mario\" ==" (Winner "Mario")
        , Views.viewTitle "Variants with different Types:"
        , Views.viewValue "IndianaJones 1 ==" (IndianaJones 1)
        , Views.viewValue "IndianaJones \"2\" ==" (IndianaJones "2")
        ]


movieToString movie =
    case movie of
        IndianaJones e ->
            "Film: Indiana Jones " ++ e

        StarWars e ->
            "Film: Star Wars " ++ e
