module TicTacToe exposing (init, main, update, view)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)
import Html.Events exposing (onClick)



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
    { cells : List (Maybe Player)
    , status : GameStatus
    }


type Player
    = X
    | O


type GameStatus
    = Playing Player
    | Tie
    | GameOver Player (List Int)


type Msg
    = NewGame
    | ClickCell Int


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Model (List.repeat 9 Nothing) (Playing X)


update msg model =
    case msg of
        NewGame ->
            init

        ClickCell index ->
            case model.status of
                Playing player ->
                    model
                        |> nextPlayer player index
                        |> playerClickCell player index
                        |> updateGameStatus player

                Tie ->
                    model

                GameOver player winningCells ->
                    model


updateGameStatus player model =
    let
        winningCells =
            findWinningCells player model.cells
    in
    if isTie model.cells then
        { model | status = Tie }

    else if playerHasWon winningCells then
        { model | status = GameOver player winningCells }

    else
        model


isTie cells =
    cells
        |> List.filter ((==) Nothing)
        |> List.length
        |> (==) 0


findWinningCells : Player -> List (Maybe Player) -> List Int
findWinningCells player cells =
    [ [ 0, 1, 2 ]
    , [ 3, 4, 5 ]
    , [ 6, 7, 8 ]
    , [ 0, 4, 8 ]
    , [ 6, 4, 2 ]
    , [ 0, 3, 6 ]
    , [ 1, 4, 7 ]
    , [ 2, 5, 8 ]
    ]
        |> List.filter (isTris player cells)
        |> List.head
        |> Maybe.withDefault []


playerHasWon : List Int -> Bool
playerHasWon indexes =
    List.length indexes == 3


isTris player cells indexes =
    cells
        |> List.indexedMap Tuple.pair
        |> List.filter (\t -> List.member (Tuple.first t) indexes && Tuple.second t == Just player)
        |> List.length
        |> (==) 3


nextPlayer player index model =
    if isEmptyCell index model.cells then
        { model | status = Playing (getOpponent player) }

    else
        model


getOpponent player =
    case player of
        X ->
            O

        O ->
            X


isEmptyCell index cells =
    cells
        |> List.drop index
        |> List.head
        |> Maybe.withDefault (Just X)
        |> (==) Nothing


playerClickCell player index model =
    { model | cells = List.indexedMap (updateCellValue player index) model.cells }


updateCellValue : Player -> Int -> Int -> Maybe Player -> Maybe Player
updateCellValue player selectedIndex cellIndex cellValue =
    if cellIndex == selectedIndex && cellValue == Nothing then
        Just player

    else
        cellValue


view model =
    div
        [ style "background" "white"
        , style "display" "flex"
        , style "flex-direction" "column"
        ]
        [ viewGrid model.cells model.status
        , viewGameStatus model.status
        , viewStartNewGame
        ]


viewStartNewGame =
    div [ style "text-align" "center" ]
        [ Html.button [ onClick NewGame ] [ text "Nuova Partita" ]
        ]


viewGameStatus : GameStatus -> Html Msg
viewGameStatus gameStatus =
    case gameStatus of
        Playing player ->
            div
                [ style "font-size" "36pt"
                , style "text-align" "center"
                ]
                [ text ("Tocca al giocatore: " ++ playerToString player) ]

        Tie ->
            div
                [ style "font-size" "36pt"
                , style "text-align" "center"
                ]
                [ text "La partita è finita in pareggio!" ]

        GameOver player winningCells ->
            div
                [ style "font-size" "36pt"
                , style "text-align" "center"
                ]
                [ text ("Ha Vinto il Giocatore: " ++ playerToString player) ]


viewGrid cells gameStatus =
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
            (List.indexedMap (viewCell gameStatus) cells)
        ]


viewCell gameStatus index cell =
    let
        bgColor =
            gameStatusToColor gameStatus index
    in
    div
        [ style "width" "200px"
        , style "height" "200px"
        , style "border" "1px solid black"
        , style "display" "flex"
        , style "justify-content" "center"
        , style "align-items" "center"
        , style "font-size" "48pt"
        , style "background-color" bgColor
        , onClick (ClickCell index)
        ]
        [ text (cellToString cell) ]


gameStatusToColor gameStatus index =
    case gameStatus of
        GameOver player winningCells ->
            if List.member index winningCells then
                "lightgreen"

            else
                "white"

        Tie ->
            "lightgray"

        Playing player ->
            "white"


cellToString cell =
    case cell of
        Just player ->
            playerToString player

        Nothing ->
            ""


playerToString player =
    case player of
        X ->
            "✖️"

        O ->
            "⭕"
