module Main exposing (..)

import Html exposing (Html, text, div, span)
import Html.Attributes exposing (src, class)


---- MODEL ----


type alias Model =
    {}


init : ( Model, Cmd Msg )
init =
    ( {}, Cmd.none )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div [ class "omikuji" ]
        [ div [ class "omikuji-inner" ]
            [ div
                [ class "title-elm" ]
                [ span [ class "title-e" ] [ text "え" ]
                , span [ class "title-l" ] [ text "る" ]
                , span [ class "title-m" ] [ text "む" ]
                ]
            , span [ class "title" ] [ text "おみくじ" ]
            ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
