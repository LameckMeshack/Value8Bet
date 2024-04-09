defmodule Value8.Games.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :abrrv, :string
    belongs_to :category, Value8.Games.Category

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(team, attrs) do
    team
    |> cast(attrs, [:name, :abrrv])
    |> validate_required([:name, :abrrv])
    |> unique_constraint(:abrrv)
    |> unique_constraint(:name)
  end
end
