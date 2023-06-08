module G_CustomTypes exposing (init, main, update, view)

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
    Views.page "Types"
        [ Views.example "GameStatus:" Playing
        , Views.title "Types with informations"
        , Views.example "Winner \"Mario\" ==" (Winner "Mario")
        , Views.title "Variants with different Types:"
        , Views.example "IndianaJones 1 ==" (IndianaJones 1)
        , Views.example "IndianaJones \"2\" ==" (IndianaJones "2")
        ]


movieToString movie =
    case movie of
        IndianaJones e ->
            "Film: Indiana Jones " ++ e

        StarWars e ->
            "Film: Star Wars " ++ e
