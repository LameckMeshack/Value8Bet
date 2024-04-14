defmodule Value8.Bets.Odds do
  use Ecto.Schema
  import Ecto.Changeset

  schema "odds" do
    field :team1_odds, :decimal
    field :team2_odds, :decimal
    field :draw_odds, :decimal
     field :deleted_at, :utc_datetime
    belongs_to :fixture, Value8.Games.Fixture

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(odds, attrs) do
    odds
    |> cast(attrs, [:team1_odds, :team2_odds, :fixture_id])
    |> validate_required([:team1_odds, :team2_odds, :fixture_id])
  end
end
