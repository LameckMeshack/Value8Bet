defmodule Value8Web.FixtureBetLive do
  use Value8Web, :live_view

 alias Value8.Repo
 alias Value8.Games
#  alias Value8.Bets


def mount(params, _session, socket) do
  # Extract the id from the params
  id = Map.get(params, "id")

  fixture = Games.get_fixture!(id)
  user_id = socket.assigns.current_user.id

  socket = assign(socket, :fixture, fixture)
  socket = assign(socket, :user_id, user_id)

  {:ok, socket}
end


def handle_event("place_bet", %{"bet_option" => bet_option, "amount" => amount}, socket) do
 current_fixture = socket.assigns.fixture
 user_id = socket.assigns.user_id

 amount_decimal = Decimal.new(amount)
 # Calculate the potential payout based on the bet option and the odds from the fixture
 potential_payout = case bet_option do
    "team1" -> Decimal.mult(amount_decimal, Decimal.new(current_fixture.odds.team1_odds))
    "team2" -> Decimal.mult(amount_decimal, Decimal.new(current_fixture.odds.team2_odds))
    "draw" -> Decimal.mult(amount_decimal, Decimal.new(current_fixture.odds.draw_odds))
 end

 selected_team = case bet_option do
    "team1" -> current_fixture.team1.id
    "team2" -> current_fixture.team2.id
    "draw" -> 0
 end



 # Prepare the bet attributes
 bet_attrs = %{
    status: :pending,
    # result: :pending,
    selected_result: String.to_atom(bet_option),
    amount: amount_decimal,
    potential_payout: potential_payout,
    user_id: user_id,
    fixture_id: current_fixture.id,
    selected_team_id: selected_team
 }

 # Create a new bet changeset
 changeset = Value8.Bets.Bet.changeset(%Value8.Bets.Bet{}, bet_attrs)

  IO.puts("Bet changeset: #{inspect(bet_attrs)}")

  changeset = Value8.Bets.Bet.changeset(%Value8.Bets.Bet{}, bet_attrs)

 case Repo.insert(changeset) do
    {:ok, _bet} ->
      socket =
        socket |> put_flash(:info, "Bet saved successfully, send confirmation to the user")

      {:noreply, socket}
    {:error, changeset} ->
      socket =
        socket |> put_flash(:error, "Failed to save bet")

      {:noreply, socket |> assign(:bet_errors, changeset.errors)}
  end

end

end
