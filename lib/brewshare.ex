defmodule Brewshare do
  @moduledoc """
  Brewshare keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  defdelegate most_recent_recipes(count), to: Brewshare.Recipe.Repo, as: :most_recent
end
