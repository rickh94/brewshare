defmodule Brewshare.Recipe.Repo do
  alias Brewshare.{Recipe, Repo}
  import Ecto.Query, only: [from: 2]

  def most_recent(count) do
    from(r in Recipe, limit: ^count, order_by: [desc: r.inserted_at])
    |> Repo.all()
  end

end
