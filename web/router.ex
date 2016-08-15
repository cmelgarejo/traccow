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

    get "/", DashboardController, :index
    get "/data", DashboardController, :grid_data
    resources "/weight_types", WeightTypeController
    resources "/weights", WeightController
    resources "/venues", VenueController
    resources "/clients", ClientController
    resources "/events", EventController
    resources "/files", FileController
    resources "/breed", BreedController
    resources "/positions", PositionController
    resources "/position_history", PositionHistoryController
  end

  # Other scopes may use custom stacks.
  # scope "/api", Traccow do
  #   pipe_through :api
  # end
end
