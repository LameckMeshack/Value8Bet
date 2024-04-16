defmodule Value8.Bets.Profit do
  use Ecto.Schema
  import Ecto.Changeset

  schema "profits" do
    belongs_to :user, Value8.Accounts.User
    belongs_to :bet, Value8.Bets.Bet
    field :profit_amount, :decimal
     field :deleted_at, :utc_datetime

    timestamps()
  end

  def changeset(profit, attrs) do
    profit
    |> cast(attrs, [:user_id, :bet_id, :profit_amount])
    |> validate_required([:user_id, :bet_id, :profit_amount])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:bet_id)
  end
end
