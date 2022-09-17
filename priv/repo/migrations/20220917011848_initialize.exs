defmodule Brewshare.Repo.Migrations.Initialize do
  use Ecto.Migration

  def change do

    create table(:brewers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :brand, :string
      add :method, :string

      timestamps()
    end


    create table(:grinders, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :brand, :string
      add :name, :string
      add :spec_notes, :text

      timestamps()
    end

    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: true
      add :username, :string

      timestamps()
    end

    create table(:coffees, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :blend, :string, null: true
      add :coo, :string, null: true
      add :roast, :string
      add :flavor_notes, :text, null: true

      timestamps()
    end


    create table(:recipes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :weight, :float
      add :grind, :string
      add :water_mass, :float
      add :water_temp, :float
      add :steps, :text
      add :duration, :float
      add :notes, :text, null: true
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end


    create table(:brews, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :notes, :text, null: true
      add :filter, :string, null: true
      add :flavor_rating, :integer, null: true
      add :datetime, :utc_datetime
      add :coffee_id, references(:coffees, on_delete: :nothing, type: :binary_id)
      add :grinder_id, references(:grinders, on_delete: :nothing, type: :binary_id), null: true
      add :brewer_id, references(:brewers, on_delete: :nothing, type: :binary_id)
      add :recipe_id, references(:recipes, on_delete: :nothing, type: :binary_id)
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end


    create index(:brews, [:coffee_id])
    create index(:brews, [:grinder_id])
    create index(:brews, [:brewer_id])
    create index(:brews, [:recipe_id])
    create index(:brews, [:user_id])
    create index(:recipes, [:user_id])

    create unique_index(:users, [:username])

  end
end
