defmodule Brewshare.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :name, :string
    field :username, :string
    field :email, :string
    has_many :brews, Brewshare.Brew
    has_many :recipes, Brewshare.Recipe

    timestamps()
  end

  @doc false
  def changeset(user \\ %User{}, attrs) do
    user
    |> cast(attrs, [:name, :username, :email])
    |> validate_required([:username, :email])
    |> unique_constraint(:username)
  end
end
