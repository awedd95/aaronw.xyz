defmodule ResumeWeb.Router do
  use ResumeWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end
  
  scope "/", ResumeWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/projects", PageController, :index
    get "/about", PageController, :index
    get "/contact", PageController, :index
  end

   pipeline :api do
     plug Plug.Parsers,
      parsers: [:urlencoded, :multipart, :json, Absinthe.Plug.Parser],
      pass: ["*/*"],
      json_decoder: Jason
     plug Absinthe.Plug,
      schema: ResumeWeb.Schema
   end

  scope "/api" do
    pipe_through(:api)
  
    forward "/graphiql",
      Absinthe.Plug.GraphiQL,
      schema: ResumeWeb.Schema,
      interface: :playground
    
    forward "/",
      Absinthe.Plug,
      schema: ResumeWeb.Schema
  
  end
    #    forward("/graphql", Absinthe.Plug, schema: ResumeWeb.Schema)
  end
