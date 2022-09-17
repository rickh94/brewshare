defmodule Brewshare.Brew do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "brews" do
    field :datetime, :utc_datetime
    field :flavor_rating, :integer
    field :filter, :string
    field :notes, :string
    belongs_to(:recipe, Brewshare.Recipe)
    belongs_to(:coffee, Brewshare.Coffee)
    belongs_to(:grinder, Brewshare.Grinder)
    belongs_to(:brewer, Brewshare.Brewer)
    belongs_to(:user, Brewshare.User)

    timestamps()
  end

  @doc false
  def changeset(brew \\ %Brew{}, attrs) do
    brew
    |> cast(attrs, [:notes, :flavor_rating, :datetime, :coffee_id, :recipe_id, :brewer_id, :user_id])
    |> validate_required([:datetime, :coffee_id, :recipe_id, :brewer_id, :user_id])
    |> foreign_key_constraint(:recipe_id)
    |> foreign_key_constraint(:coffee_id)
    |> foreign_key_constraint(:brewer_id)
    |> foreign_key_constraint(:user_id)
  end
end
