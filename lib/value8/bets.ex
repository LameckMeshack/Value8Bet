defmodule Value8.Bets do


  import Ecto.Query, warn: false
  alias Value8.Repo


  # Odds Methods

  alias Value8.Bets.Odds

  def create_odds(attrs \\ %{}) do
    %Odds{}
    |> Odds.changeset(attrs)
    |> Repo.insert()
  end


# Bet Methods
  alias Value8.Bets.Bet


def get_bet!(id) do
  bet = Repo.get!(Bet, id)
  bet = Repo.preload(bet, [:fixture, :selected_team, fixture: [:team1, :team2]])
  bet
end

# list user bets
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
