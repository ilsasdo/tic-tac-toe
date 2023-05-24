module Main exposing (..)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Style



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { player : Player
    , cells : List (Maybe Player)
    , status : GameStatus
    , winningCells : List Int
    }


type GameStatus
    = Playing
    | End
    | Tie


type Player
    = X
    | O


init : Model
init =
    Model X (List.repeat 9 Nothing) Playing []



-- UPDATE


type Msg
    = Click Int
    | PlayAgain


update : Msg -> Model -> Model
update msg model =
    case msg of
        PlayAgain ->
            model
                |> playAgain
                |> nextPlayer

        Click selectedCell ->
            model
                |> clickCell selectedCell
                |> updateGameStatus
                |> nextPlayer


playAgain model =
    { model
        | status = Playing
        , cells = List.repeat 9 Nothing
        , winningCells = []
    }


updateGameStatus model =
    let
        idxs =
            gameOver model
    in
    if List.length idxs > 0 then
        { model | status = End, winningCells = idxs }

    else
        model


gameOver : Model -> List Int
gameOver model =
    threeInARow [ 0, 1, 2 ] model.player model.cells
        ++ threeInARow [ 3, 4, 5 ] model.player model.cells
        ++ threeInARow [ 6, 7, 8 ] model.player model.cells
        ++ threeInARow [ 0, 3, 6 ] model.player model.cells
        ++ threeInARow [ 1, 4, 7 ] model.player model.cells
        ++ threeInARow [ 2, 5, 8 ] model.player model.cells
        ++ threeInARow [ 0, 4, 8 ] model.player model.cells
        ++ threeInARow [ 2, 4, 6 ] model.player model.cells


iff true false condition =
    if condition then
        true

    else
        false


threeInARow idxs player cells =
    cells
        |> List.indexedMap Tuple.pair
        |> List.filter (\t -> List.member (Tuple.first t) idxs)
        |> List.filter (\t -> Tuple.second t == Just player)
        |> List.length
        |> (==) 3
        |> iff idxs []


clickCell selectedCell model =
    { model | cells = List.indexedMap (tickCell model selectedCell) model.cells }


tickCell : Model -> Int -> Int -> Maybe Player -> Maybe Player
tickCell model selectedCell i cell =
    if model.status == Playing && selectedCell == i && cell == Nothing then
        Just model.player

    else
        cell


nextPlayer model =
    if model.status == End then
        model

    else
        case model.player of
            X ->
                { model | player = O }

            O ->
                { model | player = X }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Style.ticTacToe
        , div [ class "tic-tac-toe", class (toTieClass model) ] (viewCells model ++ [ viewStatus model, viewPlayAgainButton ])
        ]


toTieClass : Model -> String
toTieClass model =
    if model.status == Tie then
        "tie"

    else
        ""


viewPlayAgainButton =
    button [ onClick PlayAgain ] [ text "Nuova Partita" ]


viewStatus model =
    p [ class "game-status" ] [ text (statusToString model) ]


statusToString model =
    case model.status of
        Playing ->
            "Tocca al giocatore: " ++ toString (Just model.player)

        End ->
            "Ha vinto il Giocatore " ++ toString (Just model.player)

        Tie ->
            "La Partita è finita in pareggio."


viewCells model =
    List.indexedMap (viewCell model.winningCells) model.cells


viewCell : List Int -> Int -> Maybe Player -> Html Msg
viewCell winningCells i cell =
    div
        [ class "cell"
        , class (toWinningClass i winningCells)
        , class ("cell-" ++ String.fromInt i)
        , onClick (Click i)
        ]
        [ text (toString cell) ]


toWinningClass i winningCells =
    if List.member i winningCells then
        "win"

    else
        ""


toString : Maybe Player -> String
toString cell =
    case cell of
        Just X ->
            "X"

        Just O ->
            "O"

        Nothing ->
            ""
