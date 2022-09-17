defmodule BrewshareWeb.Router do
  use BrewshareWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {BrewshareWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  live_session :public do
    scope "/", BrewshareWeb do
      pipe_through :browser

      live "/", PageLive
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", BrewshareWeb do
  #   pipe_through :api
  # end
end
