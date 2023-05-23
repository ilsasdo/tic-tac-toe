module Main exposing (..)

import Browser
import Html exposing (Html, button, div, p, text)
import Html.Attributes exposing (class, value)
import Html.Events exposing (onClick)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { player : Player
    , cells : List (Maybe Player)
    , status : GameStatus
    }


type GameStatus
    = Playing
    | End


type Player
    = X
    | O


init : Model
init =
    Model X (List.repeat 9 Nothing) Playing



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
    }


updateGameStatus model =
    if gameOver model then
        { model | status = End }

    else
        model


gameOver : Model -> Bool
gameOver model =
    threeInARow [ 0, 1, 2 ] model.player model.cells
        || threeInARow [ 3, 4, 5 ] model.player model.cells
        || threeInARow [ 6, 7, 8 ] model.player model.cells
        || threeInARow [ 0, 3, 6 ] model.player model.cells
        || threeInARow [ 1, 4, 7 ] model.player model.cells
        || threeInARow [ 2, 5, 8 ] model.player model.cells
        || threeInARow [ 0, 4, 8 ] model.player model.cells
        || threeInARow [ 2, 4, 6 ] model.player model.cells


threeInARow idxs player cells =
    cells
        |> List.indexedMap Tuple.pair
        |> List.filter (\t -> List.member (Tuple.first t) idxs)
        |> List.filter (\t -> Tuple.second t == Just player)
        |> List.length
        |> (==) 3


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
    div [ class "tic-tac-toe" ]
        (viewCells model ++ [ viewStatus model, viewPlayAgainButton ])


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


viewCells model =
    List.indexedMap viewCell model.cells


viewCell : Int -> Maybe Player -> Html Msg
viewCell i cell =
    div
        [ class "cell"
        , class ("cell-" ++ String.fromInt i)
        , onClick (Click i)
        ]
        [ text (toString cell) ]


toString : Maybe Player -> String
toString cell =
    case cell of
        Just X ->
            "X"

        Just O ->
            "O"

        Nothing ->
            ""
