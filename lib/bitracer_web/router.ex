defmodule BitracerWeb.Router do
  use BitracerWeb, :router

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

  scope "/", BitracerWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/root", RootController, :new
    get "/store", StoreController, :new
    resources "/users", UserController, only: [:new, :delete, :create]
    resources "/bets", BetController, only: [:index, :show]
    get "/login", SessionController, :new
    post "/login", SessionController, :create
    get "/logout", SessionController, :show
    delete "/logout", SessionController, :delete

  end

  # Other scopes may use custom stacks.
  # scope "/api", BitracerWeb do
  #   pipe_through :api
  # end
end
