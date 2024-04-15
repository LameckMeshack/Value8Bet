defmodule Value8.Bets do


  import Ecto.Query, warn: false
  alias Value8.Repo
  use Ecto.Schema

  # Odds Methods

  alias Value8.Bets.Odds

  def create_odds(attrs \\ %{}) do
    %Odds{}
    |> Odds.changeset(attrs)
    |> Repo.insert()
  end


# Bet Methods
  alias Value8.Bets.Bet


def random_unwon_bet do
    from(b in Bet,
      where: b.status != :won,
      order_by: fragment("RANDOM()"),
      limit: 1
    )
    |> Repo.one()
    |> Repo.preload(:user)
 end


def get_bet!(id) do
  bet = Repo.get!(Bet, id)
  bet = Repo.preload(bet, [:fixture, :selected_team, fixture: [:team1, :team2]])
  bet
end

# list user bets
@spec list_user_bets(any()) :: nil | [%{optional(atom()) => any()}] | %{optional(atom()) => any()}
def list_user_bets(user_id) do
  Bet
  |> where(user_id: ^user_id)
  |> Repo.all()
  |> Repo.preload( [:fixture, :selected_team,fixture: [:team1, :team2]])
end


 def delete_bet(bet_id) when is_integer(bet_id) do
  bet = Repo.get!(Bet, bet_id)
  Repo.delete(bet)
end

end
