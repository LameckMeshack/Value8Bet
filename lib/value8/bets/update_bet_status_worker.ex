defmodule Value8.Bets.UpdateBetStatusWorker do
alias Value8.Repo
 alias Value8.Bets
 use Oban.Worker, queue: :default, max_attempts: 5

#  alias Value8.Bets.Bet
 alias Value8.Bets.BetPlacedNotifier

 @impl Oban.Worker
 def perform(%Oban.Job{attempt: attempt} = _job) do
    # Fetch a random bet that is not already won
    bet = Bets.random_unwon_bet()

    if bet do
      # Update the bet status to :won
      # bet
      # |> Bet.changeset(%{status: :won})
      # |> Repo.update()

      # Send an email to the user
      BetPlacedNotifier.bet_won(bet.user.email, "/path/to/bet/details", bet.potential_payout)
    end

    # Return :ok to indicate success
    :ok
 end
end
