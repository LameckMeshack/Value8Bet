defmodule Value8.Games.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :result, Ecto.Enum, values: [:team1, :team2, :draw]
    field :team1_score, :integer
    field :team2_score, :integer
    belongs_to :fixture, Value8.Games.Fixture

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:team1_score, :team2_score, :result])
    |> validate_required([:team1_score, :team2_score, :result])
  end
end
