module Commons exposing (..)

import Element exposing (Element, el, fill, row, text, width)
import Element.Font as Font
import Html.Attributes exposing (style)


fullPage =
    [ style "background" "white"
    , style "height" "100vh"
    , style "text-align" "center"
    , style "font-family" "monospace"
    , style "font-size" "24pt"
    ]


viewPage title rows =
    Element.layout [] <|
        Element.column
            [ Font.family [ Font.monospace ]
            , width fill
            ]
        <|
            [ Element.el
                [ width Element.fill, Font.center, Font.size 48, Font.bold ]
                (text title)
            ]
                ++ rows


viewValue : String -> a -> Element msg
viewValue label value =
    Element.row
        [ width Element.fill
        , Font.family [ Font.monospace ]
        , Font.size 36
        ]
        [ Element.el
            [ width (Element.fillPortion 1)
            , Font.alignRight
            , Font.color (Element.rgb 0.5 0.5 0.5)
            ]
            (text label)
        , Element.el
            [ width (Element.fillPortion 2)
            , Font.alignLeft
            , Element.padding 10
            ]
            (text <| Debug.toString value)
        ]
