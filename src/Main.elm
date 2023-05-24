module Main exposing (..)

import Browser
import Html exposing (Html, div, text)



-- MAIN


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


update msg model =
    model



-- VIEW


view : Model -> Html msg
view model =
    div []
        [ text "Hello, World!" ]
