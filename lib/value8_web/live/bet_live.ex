defmodule Value8Web.BetLive do
alias Value8.Bets
use Value8Web, :live_view


 alias Value8.Bets


def mount(params, _session, socket) do
  # Extract the id from the params
  id = Map.get(params, "id")

  bet = Bets.get_bet!(id)
  user_id = socket.assigns.current_user.id

  socket = assign(socket, :bet, bet)
  socket = assign(socket, :user_id, user_id)

  {:ok, socket}
end

@impl Phoenix.LiveView
def render(assigns) do
  ~H"""
    <div class="flex flex-col items-center justify-center bg-gray-100">
  <div class="bg-white p-6 rounded shadow-md w-full max-w-md">
    <h2 class="text-2xl font-bold mb-4">Bet Details</h2>
    <p>Status: <%= @bet.status %></p>
    <p>Amount: <%= @bet.amount %></p>
    <p>Potential Payout: <%= @bet.potential_payout %></p>
    <p>Selected Team: <%= @bet.selected_team.name %></p>

    <h2 class="text-2xl font-bold mt-6 mb-4">Fixture Details</h2>
    <p>Match Date: <%= @bet.fixture.match_date %></p>
    <p>Match Time: <%= @bet.fixture.match_time %></p>
    <p>Team 1: <%= @bet.fixture.team1.name %></p>
    <p>Team 2: <%= @bet.fixture.team2.name %></p>

    <button class="bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-6" phx-click="cancel_bet">Cancel Bet</button>
  </div>
</div>
  """
end

def handle_event("cancel_bet", _value, socket) do
  Bets.delete_bet(socket.assigns.bet.id)
  {:noreply, redirect(to: '/')}
end
end
