defmodule TestAppWeb.Router do
  use TestAppWeb, :router

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

  scope "/", TestAppWeb do
    pipe_through :browser # Use the default browser stack

    get "/", DrinkController, :index

resources "/drinks", DrinkController
  end

  # Other scopes may use custom stacks.
  # scope "/api", TestAppWeb do
  #   pipe_through :api
  # end
end
