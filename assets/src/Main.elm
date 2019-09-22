module Main exposing (Model, Msg(..), Page(..), init, main, update, urlParser, urlToPage, view)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
import Components
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Url
import Url.Parser as Url exposing ((</>), Parser)


type Page
    = Index
    | Projects
    | About
    | Contact


urlToPage : Url.Url -> Page
urlToPage url =
    url
        |> Url.parse urlParser
        |> Maybe.withDefault Index


urlParser : Parser (Page -> a) a
urlParser =
    Url.oneOf
        [ Url.map Index Url.top
        , Url.map Projects (Url.s "projects")
        , Url.map About (Url.s "about")
        , Url.map Contact (Url.s "contact")
        ]


type alias Model =
    { navKey : Nav.Key
    , page : Page
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( { navKey = key
      , page = urlToPage url
      }
    , Cmd.none
    )


type Msg
    = LinkClicked UrlRequest
    | UrlChange Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Internal url ->
                    ( model
                    , Nav.pushUrl model.navKey (Url.toString url)
                    )

                External url ->
                    ( model
                    , Nav.load url
                    )

        UrlChange url ->
            ( { model | page = urlToPage url }
            , Cmd.none
            )


view : Model -> Browser.Document Msg
view model =
    { title = "Aaron Wedd - Developer"
    , body =
        [ Components.nav
        , case model.page of
            Index ->
                Components.index

            Projects ->
                Components.projects

            About ->
                Components.about

            Contact ->
                Components.contact
        ]
    }


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = always Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChange
        }
