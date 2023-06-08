module Main exposing (init, main, update, view)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (style)


type alias Model =
    { cells : List Player
    , currentPlayer : Player
    }


type Player
    = X
    | O


main =
    Browser.sandbox { init = init, update = update, view = view }


init =
    Model [ X, X, X, O, O, O, X, X, X ] X


update msg model =
    model


isTris : List Int -> Player -> List (Maybe Player) -> Bool
isTris indexes player list =
    indexes
        |> List.all (isPlayer player list)


isPlayer : Player -> List (Maybe Player) -> Int -> Bool
isPlayer player list index =
    list
        |> List.drop index
        |> List.head
        |> Maybe.withDefault Nothing
        |> (==) (Just player)


nextPlayer model =
    { model | currentPlayer = opponent model.currentPlayer }


opponent player =
    case player of
        X ->
            O

        O ->
            X


tickCell index model =
    { model
        | cells =
            List.indexedMap
                (\i ->
                    \v ->
                        if i == index then
                            Just model.currentPlayer

                        else
                            v
                )
                model.cells
    }


view model =
    div
        [ style "background" "white"
        , style "width" "650px"
        ]
        (List.indexedMap viewCell model.cells
            ++ [ viewCurrentPlayer model.currentPlayer
               , viewWinner model.winner
               ]
        )


viewWinner player =
    case player of
        Nothing ->
            text ""

        Just a ->
            div [ style "font-size" "36pt" ]
                [ text ("Ha vinto il giocatore: " ++ playerToString player) ]


viewCurrentPlayer player =
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
    "IMPLEMENT ME!"
