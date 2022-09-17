defmodule Brewshare.Repo.Migrations.ChangeRecipeStepsToArray do
  import Ecto.Query
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :step_list, {:array, :string}
      remove :steps
    end
  end
end
