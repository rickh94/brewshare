defmodule Brewshare.Repo.Migrations.RemoveCoffeeBlendField do
  use Ecto.Migration

  def change do
    alter table(:coffees) do
      remove :blend
    end
  end
end
