defmodule Brewshare.Grinder do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "grinders" do
    field :brand, :string
    field :name, :string
    field :spec_notes, :string

    timestamps()
  end

  @doc false
  def changeset(grinder \\ %Grinder{}, attrs) do
    grinder
    |> cast(attrs, [:brand, :name, :spec_notes])
    |> validate_required([:brand, :name])
  end
end
