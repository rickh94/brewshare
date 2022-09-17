defmodule Brewshare.Recipe do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "recipes" do
    field :name, :string
    field :duration, :float
    field :grind, :string
    field :notes, :string
    field :step_list, {:array, :string}
    field :water_mass, :float
    field :water_temp, :float
    field :weight, :float
    belongs_to(:user, Brewshare.User)

    timestamps()
  end

  @doc false
  def changeset(recipe \\ %Recipe{}, attrs) do
    recipe
    |> cast(attrs, [:weight, :grind, :water_mass, :water_temp, :step_list, :duration, :notes, :user_id, :name])
    |> validate_required([:weight, :grind, :water_mass, :water_temp, :step_list, :duration, :user_id, :name])
    |> foreign_key_constraint(:user_id)
  end
end
