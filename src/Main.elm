module Main exposing (Model, Msg(..), init, main, update, view)

import Browser
import Html exposing (div, text)
import Html.Events exposing (onClick)


main =
    Browser.sandbox { init = init, update = update, view = view }


type alias Model =
    { counter : Int }


type Msg
    = Increment


init =
    Model 0


update msg model =
    case msg of
        Increment ->
            { model | counter = model.counter + 1 }


view model =
    div [ onClick Increment ] [ text (String.fromInt model.counter) ]
