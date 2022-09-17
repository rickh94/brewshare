defmodule Brewshare.Coffee do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "coffees" do
    field :coo, :string
    field :flavor_notes, :string
    field :name, :string
    field :roaster, :string
    field :link, :string
    field :roast, Ecto.Enum, values: [:light, :medium, :dark, :blend]

    timestamps()
  end

  @doc false
  def changeset(coffee \\ %Coffee{}, attrs) do
    coffee
    |> cast(attrs, [:name, :coo, :roast, :flavor_notes, :roaster, :link])
    |> validate_required([:name, :roast])
  end
end
