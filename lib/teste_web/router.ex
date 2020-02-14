defmodule TesteWeb.Router do
  use TesteWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TesteWeb do
    pipe_through :browser

    get "/cadastro", PageController, :cadastro
    get "/index", PageController, :index 
    get "/", PageController, :login
    get "/historia", PageController, :show
    get "/artista/:id", PageController, :view
    get "/tentativa", PageController, :tenta
    post "/tentativa", PageController, :create
    post "/save", PageController, :save_cad
    post "/login", PageController, :login_user
  end

  # Other scopes may use custom stacks.
  # scope "/api", TesteWeb do
  #   pipe_through :api
  # end
end
