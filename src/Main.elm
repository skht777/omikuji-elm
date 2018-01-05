module Main exposing (..)

import Html exposing (Html, text, div, span)
import Html.Attributes exposing (src, class)
import Html.Events exposing (onClick)
import Random

---- MODEL ----


type alias Model =
    { result: String, state: State }


init : ( Model, Cmd Msg )
init =
    ( { result = "", state = Init }, Cmd.none )



---- UPDATE ----


type Msg
    = Pull
    | Result Int


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Pull ->
            ( { model | state = Drawed }, Random.generate Result <| Random.int 0 (List.length pattern - 1)  )
        Result next ->
            ( { model | result = Maybe.withDefault "" <| listElem next pattern }, Cmd.none )

pattern : List String
pattern =
    [ "大吉", "吉", "中吉", "小吉", "末吉", "凶", "大凶" ]

type State
    = Init
    | Drawed



---- VIEW ----


listElem : Int -> (List a) -> (Maybe a)
listElem num list = List.head <| List.drop num list

view : Model -> Html Msg
view { result, state } =
    let
      fortune =
        case state of
            Init ->
                [ div [ class "title-elm" ]
                    [ span [ class "title-e" ] [ text "え" ]
                    , span [ class "title-l" ] [ text "る" ]
                    , span [ class "title-m" ] [ text "む" ]
                    ]
                , span [ class "title" ] [ text "おみくじ" ]
                ]
            Drawed ->
                [ span [ class "title" ] [ text result ] ]
    in
    div [ class "omikuji" ]
        [ div [ class "omikuji-inner", onClick Pull ] fortune ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
