module Views exposing (..)

import Element exposing (Element, fill, padding, rgb, text, width)
import Element.Background as Background
import Element.Font as Font exposing (center)
import Element.Input exposing (button)


viewPage title rows =
    Element.layout [ Background.color (rgb 1 1 1) ] <|
        Element.column
            [ Font.family [ Font.monospace ]
            , width fill
            ]
        <|
            [ Element.el
                [ width Element.fill, Font.center, Font.size 48, Font.bold, padding 100 ]
                (text title)
            ]
                ++ rows


viewTitle : String -> Element msg
viewTitle title =
    Element.row
        [ width Element.fill
        , Font.family [ Font.monospace ]
        , Font.size 36
        , Element.paddingEach { top = 80, left = 0, right = 0, bottom = 0 }
        ]
        [ Element.el
            [ width (Element.fillPortion 1)
            , Font.center
            , Font.color (Element.rgb 0.7 0.7 0.7)
            ]
            (text title)
        ]


viewValue : String -> a -> Element msg
viewValue label value =
    Element.row
        [ width Element.fill
        , Font.family [ Font.monospace ]
        , Font.size 24
        ]
        [ Element.el
            [ width (Element.fillPortion 1)
            , Font.alignRight
            , Font.color (Element.rgb 0.3 0.3 0.8)
            ]
            (text label)
        , Element.el
            [ width (Element.fillPortion 1)
            , Font.alignLeft
            , Element.padding 10
            ]
            (text <| Debug.toString value)
        ]


viewButton : String -> msg -> Element msg
viewButton label msg =
    Element.row
        [ width Element.fill
        , center
        , Font.family [ Font.monospace ]
        , Font.size 24
        ]
        [ button [] { onPress = Just msg, label = text label }
        ]
