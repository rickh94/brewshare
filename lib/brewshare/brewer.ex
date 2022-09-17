defmodule Brewshare.Brewer do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "brewers" do
    field :brand, :string
    field :method, :string
    field :name, :string

    timestamps()
  end

  @spec changeset(
          {map, map}
          | %{
              :__struct__ => atom | %{:__changeset__ => map, optional(any) => any},
              optional(atom) => any
            },
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(brewer \\ %Brewer{}, attrs) do
    brewer
    |> cast(attrs, [:name, :brand, :method])
    |> validate_required([:name, :brand, :method])
  end
end
