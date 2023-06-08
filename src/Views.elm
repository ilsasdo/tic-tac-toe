module Views exposing (..)

import Html exposing (Html, label)
import Html.Attributes exposing (style, type_, value)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt)


page pageTitle rows =
    Html.div [ style "font-family" "monospace" ] <|
        [ Html.node "style"
            []
            [ Html.text """
        body {
            background-color: white;
        }
        """ ]
        , Html.h1
            [ style "text-align" "center", style "font-size" "36pt" ]
            [ Html.text pageTitle ]
        ]
            ++ rows


title : String -> Html msg
title text =
    Html.div
        [ style "font-size" "18pt"
        , style "color" "slategray"
        ]
        [ Html.h2
            [ style "margin-bottom" "0pt"
            , style "text-align" "center"
            ]
            [ Html.text text ]
        ]


example : String -> a -> Html msg
example label value =
    Html.div
        [ style "margin-bottom" "10pt"
        , style "font-size" "24pt"
        ]
        [ Html.div
            [ style "width" "50%"
            , style "display" "inline-block"
            , style "text-align" "right"
            , style "color" "darkslateblue"
            ]
            [ Html.span [ style "padding-right" "10pt" ] [ Html.text label ] ]
        , Html.div
            [ style "width" "50%"
            , style "display" "inline-block"
            , style "color" "darkorange"
            ]
            [ Html.text <| Debug.toString value ]
        ]


button : String -> msg -> Html msg
button label msg =
    Html.div
        [ style "margin-bottom" "10pt"
        , style "font-size" "24pt"
        ]
        [ Html.div
            [ style "width" "50%"
            , style "display" "inline-block"
            , style "text-align" "right"
            , style "color" "darkslateblue"
            ]
            [ Html.button [ onClick msg ] [ Html.text label ] ]
        ]


inputNumber : String -> Int -> (Int -> msg) -> Html msg
inputNumber label val msg =
    Html.div
        [ style "margin-bottom" "10pt"
        , style "font-size" "24pt"
        ]
        [ Html.div
            [ style "width" "50%"
            , style "display" "inline-block"
            , style "text-align" "right"
            , style "color" "darkslateblue"
            ]
            [ Html.span [ style "padding-right" "10pt" ] [ Html.text label ] ]
        , Html.div
            [ style "width" "50%"
            , style "display" "inline-block"
            , style "color" "darkslateblue"
            ]
            [ Html.input [ type_ "number", onInput (String.toInt >> Maybe.withDefault val >> msg), value (String.fromInt val) ] [] ]
        ]
