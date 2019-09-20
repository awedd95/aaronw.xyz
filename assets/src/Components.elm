module Components exposing (about, index, nav)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


nav : Html msg
nav =
    div []
        [ ul [ class "navbar" ]
            [ li [] [ a [ href "/" ] [ text "Home" ] ]
            , li [] [ a [ href "/projects" ] [ text "Projects" ] ]
            , li [] [ a [ href "/about" ] [ text "About" ] ]
            , li [] [ a [ href "/contact" ] [ text "Contact" ] ]
            ]
        ]


index : Html msg
index =
    div []
        [ h1 [] [ text "Aaron Wedd" ]
        , h3 [] [ text "Developer" ]
        , ul []
            [ li [] [ a [ href "www.github.com/awedd95" ] [ text "Github" ] ]
            , li [] [ a [ href "www.linkedin.com/in/aaron-wedd" ] [ text "LinkedIn" ] ]
            ]
        ]


about : Html msg
about =
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
