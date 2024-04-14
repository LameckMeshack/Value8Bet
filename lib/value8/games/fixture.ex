defmodule Value8.Games.Fixture do
  use Ecto.Schema
  import Ecto.Changeset

  schema "fixtures" do
    field :match_date, :date
    field :match_time, :time
    belongs_to :category, Value8.Games.Category
    belongs_to :team1, Value8.Games.Team
    belongs_to :team2, Value8.Games.Team
    has_one :result, Value8.Games.Result
    has_one :odds, Value8.Bets.Odds
    has_many :bets, Value8.Bets.Bet
    field :deleted_at, :utc_datetime

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(fixture, attrs) do
    fixture
    |> cast(attrs, [:match_date, :match_time, :category_id, :team1_id, :team2_id])
    |> validate_required([:match_date, :match_time, :category_id, :team1_id, :team2_id])
  end
end
