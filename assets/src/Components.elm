module Components exposing (about, contact, index, nav, projects)

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
        , ul [ class "LinksOut" ]
            [ li [] [ a [ href "https://www.github.com/awedd95" ] [ text "Github" ] ]
            , li [] [ a [ href "https://www.linkedin.com/in/aaron-wedd" ] [ text "LinkedIn" ] ]
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


projects : Html msg
projects =
    div []
        [ h2 []
            [ text "Projects" ]
        , table [] [ th [] [ text "Project" ], th [] [ text "Language" ] ]
        ]


contact : Html msg
contact =
    div []
        [ h2 []
            [ text "Contact Me" ]
        , Html.form []
            [ legend []
                [ text "Name" ]
            , input [] []
            , legend []
                [ text "Email" ]
            , input [] []
            , legend []
                [ text "Message" ]
            , textarea [] []
            , button [] [ text "Submit" ]
            ]
        ]
