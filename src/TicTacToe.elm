module TicTacToe exposing (init, main, update, view)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)



{-
   Walkthrough:
      1. implementa 'playerToString' per renderizzare i due diversi giocatori
      2. Inizialmente le celle devono essere vuote: usa Maybe Player per rappresentarle
      3. Aggiungi un bottone per cominciare una nuova partita
      4. Quando l'utente clicca su una cella vuota, quella cella viene valorizzata con il giocatore corrente
      5. Quando l'utente clicca su una cella vuota, il giocatore corrente deve cambiare
      6. Introduci e gestisci lo stato di Parità in caso nessun giocatore vinca
      7. Determina la fine gioco:
        1. Scrivi una funzione "isTris" che dati tre indici di celle verifica che in ciascuno ci sia il giocatore richiesto.
        2. Scrivi una funzione "setGameOver" che dato un Model, ne aggiorna lo status se l'utente corrente ha fatto Tris
      8. Quando un giocatore vince, colora di rosso le celle che hanno fatto Tris
-}


type alias Model =
    { cells : List Player
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
    Model [ X, X, X, O, O, O, X, X, X ] (Playing X)


update msg model =
    model


view model =
    div
        [ style "background" "white"
        , style "display" "flex"
        , style "flex-direction" "column"
        ]
        [ viewGrid model.cells
        , viewGameStatus model.status
        ]


viewGameStatus gameStatus =
    case gameStatus of
        Playing player ->
            div
                [ style "font-size" "36pt"
                , style "text-align" "center"
                ]
                [ text ("Tocca al giocatore: " ++ playerToString player) ]


viewGrid cells =
    div
        [ style "display" "flex"
        , style "justify-content" "center"
        ]
        [ div
            [ style "display" "flex"
            , style "flex-wrap" "wrap"
            , style "width" "650px"
            , style "justify-content" "center"
            ]
            (List.indexedMap viewCell cells)
        ]


viewCell index cell =
    div
        [ style "width" "200px"
        , style "height" "200px"
        , style "border" "1px solid black"
        , style "display" "flex"
        , style "justify-content" "center"
        , style "align-items" "center"
        , style "font-size" "48pt"
        ]
        [ text (playerToString cell) ]


playerToString player =
    "🤯"
