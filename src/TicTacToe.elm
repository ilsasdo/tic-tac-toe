module TicTacToe exposing (init, main, update, view)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)



{-
   Walkthrough:
      1. implement 'playerToString'
      2. cells must be a Maybe Player
      3. Add a new Msg for the user to click on a Cell
      4. When user clicks on a cell, set that cell to current player
      5. When the user clicks on a cell, we must change the next player
      6. Only empty cells must be clickable
      7. determine endgame:
        1. write a function "isTris" to determine if three given index contains the same player
        2. write a function "isTie" to determine if all cells are filled in but no one won
        3. write a function "updateGameStatus" to update the game status
      8. Add a button to start a new game
      9. When a user wins, change the winning cells background color to red
-}


type alias Model =
    { cells : List Player
    , currentPlayer : Player
    , status : GameStatus
    }


type Player
    = X
    | O


type GameStatus
    = Playing Player


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Model [ X, X, X, O, O, O, X, X, X ] X (Playing X)


update msg model =
    model


view model =
    div
        [ style "background" "white"
        , style "width" "650px"
        ]
        (List.indexedMap viewCell model.cells
            ++ [ viewGameStatus model.status
               ]
        )


viewGameStatus gameStatus =
    case gameStatus of
        Playing player ->
            div [ style "font-size" "36pt" ]
                [ text ("Tocca al giocatore: " ++ playerToString player) ]


viewCell index cell =
    div
        [ style "width" "200px"
        , style "height" "200px"
        , style "border" "1px solid black"
        , style "display" "inline-block"
        , style "vertical-align" "top"
        , style "font-size" "48pt"
        ]
        [ text (playerToString cell) ]


playerToString player =
    "🤯"
