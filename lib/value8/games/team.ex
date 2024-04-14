defmodule Value8.Games.Team do
  use Ecto.Schema
  import Ecto.Changeset

  schema "teams" do
    field :name, :string
    field :abrrv, :string
     field :deleted_at, :utc_datetime
    belongs_to :category, Value8.Games.Category
    has_many :home_fixtures, Value8.Games.Fixture, foreign_key: :team1_id
    has_many :away_fixtures, Value8.Games.Fixture, foreign_key: :team2_id
    has_many :selected_team, Value8.Bets.Bet, foreign_key: :selected_team_id
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
