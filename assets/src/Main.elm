module Main exposing (Model, Msg(..), Page(..), init, main, update, urlParser, urlToPage, view)

import Browser exposing (UrlRequest(..))
import Browser.Navigation as Nav
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
    -- We start with our URL
    url
        -- Send it through our URL parser (located below)
        |> Url.parse urlParser
        -- And if it didn't match any known pages, return Index
        |> Maybe.withDefault Index


urlParser : Parser (Page -> a) a
urlParser =
    -- We try to match one of the following URLs
    Url.oneOf
        -- Url.top matches root (i.e. there is nothing after 'https://example.com')
        [ Url.map Index Url.top

        -- Url.s matches URLs ending with some string, in our case '/cats'
        , Url.map Projects (Url.s "projects")

        -- Again, Url.s matches a string. </> matches a '/' in the URL, and Url.int matches any integer and "returns" it, so that the user page value gets the user ID
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
        [ ul [ class "navbar" ]
            [ li [] [ a [ href "/" ] [ text "Home" ] ]
            , li [] [ a [ href "/projects" ] [ text "Projects" ] ]
            , li [] [ a [ href "/about" ] [ text "About" ] ]
            , li [] [ a [ href "/contact" ] [ text "Contact" ] ]
            ]
        , case model.page of
            Index ->
                div []
                    [ h1 [] [ text "Aaron Wedd" ]
                    , h3 [] [ text "Developer" ]
                    , ul []
                        [ li [] [ a [ href "" ] [ text "Github" ] ]
                        , li [] [ text "LinkedIn" ]
                        ]
                    ]

            Projects ->
                text "Projects!"

            About ->
                div []
                    [ h2 [] [ text "Skills" ]
                    , ul []
                        [ li []
                            [ h3 [] [ text "Frontend" ]
                            , ul []
                                [ li [] [ text "React.js" ]
                                , li [] [ text "Elm" ]
                                ]
                            ]
                        , li []
                            [ h3 [] [ text "Backend" ] ]
                        , ul []
                            [ li [] [ text "Node.js" ]
                            , li [] [ text "Express" ]
                            , li [] [ text "Elixir" ]
                            , li [] [ text "Phoenix" ]
                            ]
                        , li []
                            [ h3 [] [ text "Databases" ] ]
                        , ul []
                            [ li [] [ text "SQL" ]
                            , li [] [ text "MongoDB" ]
                            ]
                        , li []
                            [ h3 [] [ text "Miscellaneous" ] ]
                        , ul []
                            [ li [] [ text "Linux" ]
                            , li [] [ text "GraphQL APIs" ]
                            , li [] [ text "REST APIs" ]
                            ]
                        ]
                    ]

            Contact ->
                text "Contact"
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
