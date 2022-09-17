defmodule BrewshareWeb.PageLive do
  use BrewshareWeb, :live_view

  alias BrewshareWeb.Components.Recipe

  @impl true
  def mount(_params, _session, socket) do
    recent_recipes = Brewshare.most_recent_recipes(10)

    {:ok, assign(socket, recent_recipes: recent_recipes), temporary_assigns: [recent_recipes: []]}
  end

end
