defmodule BrewshareWeb.Components.Recipe do
  use Phoenix.Component

  def card(assigns) do
    ~H"""
      <div class="flex flex-col rounded-lg shadow bg-gray-50 py-4 px-6">
        <h5 class="text-xl font-bold text-yellow-900 mb-2"><%= @recipe.name %></h5>
        <p><span class="font-bold">Total Time:&nbsp;</span><%= @recipe.duration %> seconds</p>
        <p><span class="font-bold">Grind:&nbsp;</span><%= @recipe.grind %></p>
        <p><span class="font-bold">Coffee:&nbsp;</span><%= @recipe.weight %> grams</p>
        <p><span class="font-bold">Water:&nbsp;</span><%= @recipe.water_mass %> grams</p>
        <p><span class="font-bold">Temperature:&nbsp;</span><%= @recipe.water_temp %> grams</p>
      </div>
    """
  end
end

# TODO: convert duration to minutes and seconds with timex
