module I_Subscriptions exposing (init, main, update, view)

import Browser
import Html exposing (Html)
import Http
import Json.Decode exposing (Decoder, field, int, map3, string)
import Random
import Views


main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }


type alias Model =
    { loading : Bool, id : Int, quote : String, author : String }


type Msg
    = GetQuote
    | NewQuote Int
    | GotQuote (Result Http.Error Model)


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model False 0 "" "", Cmd.none )


subscriptions model =
    Sub.none


update msg model =
    case msg of
        GetQuote ->
            ( model, Random.generate NewQuote (Random.int 1 100) )

        NewQuote quoteId ->
            ( { model | id = quoteId, loading = True }
            , Http.get
                { url = "https://dummyjson.com/quotes/" ++ String.fromInt quoteId
                , expect = Http.expectJson GotQuote quoteDecoder
                }
            )

        GotQuote result ->
            case result of
                Ok quote ->
                    ( { model | loading = False, id = quote.id, quote = quote.quote, author = quote.author }, Cmd.none )

                Err _ ->
                    ( { model | quote = "Error" }, Cmd.none )


quoteDecoder : Decoder Model
quoteDecoder =
    map3 (Model False)
        (field "id" int)
        (field "quote" string)
        (field "author" string)


view : Model -> Html Msg
view model =
    Views.page "Subscriptions"
        [ Views.title model.quote
        , Views.title model.author
        , Views.loadingButton model.loading "Get a Quote!" GetQuote
        ]
