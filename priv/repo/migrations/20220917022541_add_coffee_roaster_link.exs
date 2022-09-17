defmodule Brewshare.Repo.Migrations.AddCoffeeRoasterLink do
  use Ecto.Migration

  def change do
    alter table(:coffees) do
      add :roaster, :string, null: true
      add :link, :string, null: true
    end
  end
end
