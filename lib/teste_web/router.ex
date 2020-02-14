defmodule TesteWeb.Router do
  use TesteWeb, :router
  use Pow.Phoenix.Router


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

  pipeline :protected do
    plug Pow.Plug.RequireAuthenticated,
      error_handler: Pow.Phoenix.PlugErrorHandler
  end



  scope "/", TesteWeb do
    pipe_through :browser

    get "/", PageController, :login
    get "/cadastro", PageController, :cadastro
    get "/index", PageController, :index
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
