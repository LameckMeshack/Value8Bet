defmodule Value8.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bets" do
    field :status, Ecto.Enum, values: [:pending, :won, :lost]
    field :result, Ecto.Enum, values: [:team1, :team2, :draw]
    field :selected_result, Ecto.Enum, values: [:team1, :team2, :draw]
    field :amount, :decimal
    field :potential_payout, :decimal
    # field :user_id, :id
    # field :fixture_id, :id
    # field :selected_team_id, :id
    belongs_to :user, Value8.Users.User
    belongs_to :fixture, Value8.Games.Fixture
    belongs_to :selected_team, Value8.Games.Team
    

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bet, attrs) do
    bet
    |> cast(attrs, [:selected_result, :amount, :potential_payout, :status, :result])
    |> validate_required([:selected_result, :amount, :potential_payout, :status, :result])
  end
end
