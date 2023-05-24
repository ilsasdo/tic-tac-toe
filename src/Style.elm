module Style exposing (..)

import Html exposing (text)


ticTacToe =
    Html.node "style" [] [ text """
        .tic-tac-toe {
            width: 650px;
        }

        .cell {
            width: 200px;
            height: 200px;
            background-color: lightgray;
            text-align: center;
            font-size: 8em;
            display: inline-block;
            vertical-align: top
        }

        .win {
           color: red;
        }

        .tie {
            color: gray;
        }

        .cell:hover {
            background-color: aliceblue;
        }

        .cell-0 {
            border-right: 5px solid black;
            border-bottom: 5px solid black;
        }

        .cell-3 {
            border-right: 5px solid black;
            border-bottom: 5px solid black;
        }

        .cell-6 {
            border-right: 5px solid black;
        }

        .cell-1 {
            border-right: 5px solid black;
            border-bottom: 5px solid black;
        }

        .cell-2 {
            border-bottom: 5px solid black;
        }

        .cell-4 {
            border-right: 5px solid black;
            border-bottom: 5px solid black;
        }

        .cell-5 {
            border-bottom: 5px solid black;
        }

        .cell-7 {
            border-right: 5px solid black;
        }

        """ ]
