defmodule Value8.Bets.Bet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bets" do
    field :status, Ecto.Enum, values: [:pending, :won, :lost]
    field :result, Ecto.Enum, values: [:team1, :team2, :draw]
    field :selected_result, Ecto.Enum, values: [:team1, :team2, :draw]
    field :amount, :decimal
    field :potential_payout, :decimal
    field :deleted_at, :utc_datetime
    # field :user_id, :id
    # field :fixture_id, :id
    # field :selected_team_id, :id
    belongs_to :user, Value8.Accounts.User
    belongs_to :fixture, Value8.Games.Fixture
    belongs_to :selected_team, Value8.Games.Team


    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(), map()}
          | %{
              :__struct__ => atom() | %{:__changeset__ => map(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(bet, attrs) do
  bet
  |> cast(attrs, [:status, :amount, :potential_payout, :selected_result, :user_id, :fixture_id, :selected_team_id])
  |> validate_required([:status, :amount, :potential_payout, :selected_result, :user_id, :fixture_id, :selected_team_id])
  |> validate_inclusion(:status, [:pending])
  |> validate_inclusion(:selected_result, [:team1, :team2, :draw])
end
end
