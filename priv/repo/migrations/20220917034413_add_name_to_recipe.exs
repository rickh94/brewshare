defmodule Brewshare.Repo.Migrations.AddNameToRecipe do
  use Ecto.Migration

  def change do
    alter table(:recipes) do
      add :name, :string, null: true
    end

  end
end
