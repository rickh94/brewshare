defmodule Brewshare.Repo.Migrations.NullGrinderSpecNotes do
  use Ecto.Migration

  def change do
    alter table(:grinders) do
      modify :spec_notes, :text, null: true
    end
  end
end
