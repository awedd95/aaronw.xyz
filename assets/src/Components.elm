module Components exposing (about, contact, index, nav, projects)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


nav : Html msg
nav =
    div [ class "navbar justify-content-center navbar-dark bg-primary" ]
        [ ul [ class "nav" ]
            [ li [ class "nav-item" ]
                [ a [ class "nav-link text-white", href "/" ]
                    [ text "Home" ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link text-white", href "/projects" ]
                    [ text "Projects" ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link text-white", href "/about" ]
                    [ text "About" ]
                ]
            , li [ class "nav-item" ]
                [ a [ class "nav-link text-white", href "/contact" ]
                    [ text "Contact" ]
                ]
            ]
        ]


index : Html msg
index =
    div [ class "container" ]
        [ h1 [] [ text "Aaron Wedd" ]
        , h3 [] [ text "Developer" ]
        , a [ class "btn btn-primary", href "https://www.github.com/awedd95" ]
            [ text "Github" ]
        , a [ class "btn btn-primary", href "https://www.linkedin.com/in/aaron-wedd" ]
            [ text "LinkedIn" ]
        ]


about : Html msg
about =
    div [ class "container" ]
        [ h2 [] [ text "Skills" ]
        , ul [ class "list-group" ]
            [ li [ class "list-group-item list-group-item-action active" ]
                [ h3 [] [ text "Frontend" ] ]
            , ul [ class "list-group" ]
                [ li [ class "list-group-item text-dark" ] [ text "React.js" ]
                , li [ class "list-group-item text-dark" ] [ text "Elm" ]
                ]
            , li [ class "list-group-item list-group-item-action active" ]
                [ h3 [] [ text "Backend" ] ]
            , ul [ class "list-group" ]
                [ li [ class "list-group-item text-dark" ] [ text "Node.js" ]
                , li [ class "list-group-item text-dark" ] [ text "Express" ]
                , li [ class "list-group-item text-dark" ] [ text "Elixir" ]
                , li [ class "list-group-item text-dark" ] [ text "Phoenix" ]
                ]
            , li [ class "list-group-item list-group-item-action active" ]
                [ h3 [] [ text "Databases" ] ]
            , ul [ class "list-group" ]
                [ li [ class "list-group-item text-dark" ] [ text "SQL" ]
                , li [ class "list-group-item text-dark" ] [ text "MongoDB" ]
                ]
            , li [ class "list-group-item list-group-item-action active" ]
                [ h3 [] [ text "Miscellaneous" ] ]
            , ul [ class "list-group" ]
                [ li [ class "list-group-item text-dark" ] [ text "Linux" ]
                , li [ class "list-group-item text-dark" ] [ text "GraphQL APIs" ]
                , li [ class "list-group-item text-dark" ] [ text "REST APIs" ]
                ]
            ]
        ]


projects : Html msg
projects =
    div [ class "container" ]
        [ h2 []
            [ text "Projects" ]
        , table [ class "table" ] [ th [] [ text "Project" ], th [] [ text "Language" ] ]
        ]


contact : Html msg
contact =
    div [ class "container" ]
        [ h2 []
            [ text "Contact Me" ]
        , Html.form [ class "col" ]
            [ div [ class "form-group" ]
                [ legend [ class "form-group" ]
                    [ text "Name" ]
                , input [ class "form-control" ] []
                ]
            , div [ class "form-group" ]
                [ legend [ class "form-group" ]
                    [ text "Email" ]
                , input [ class "form-control" ] []
                ]
            , div [ class "form-group" ]
                [ legend [ class "form-group" ]
                    [ text "Message" ]
                , textarea [ class "form-control" ] []
                ]
            , button [ class "btn btn-primary" ] [ text "Submit" ]
            ]
        ]
