defmodule Traccow.Router do
  use Traccow.Web, :router

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

  scope "/", Traccow do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/weight_types", WeightType
    resources "/weights", Weight
    resources "/venues", Venue
    resources "/clients", Client
    resources "/events", Event
    resources "/files", File
    resources "/breed", Breed
    resources "/positions", Position
    resources "/position_history", PositionHistory
  end

  # Other scopes may use custom stacks.
  # scope "/api", Traccow do
  #   pipe_through :api
  # end
end
