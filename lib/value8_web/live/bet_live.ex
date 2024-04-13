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
  <div class="bg-white p-8 rounded-lg shadow-2xl w-full max-w-3xl space-y-6">
    <div class="p-4 bg-blue-50 rounded-lg shadow-inner">
      <h2 class="text-2xl font-bold mb-4">Bet Details</h2>
      <p>Status: <%= @bet.status %></p>
      <p>Amount: <%= @bet.amount %></p>
      <p>Potential Payout: <%= @bet.potential_payout %></p>
      <p>Selected Team: <%= @bet.selected_team.name %></p>
    </div>

    <div class="p-4 bg-blue-50 rounded-lg shadow-inner">
      <h2 class="text-2xl font-bold mb-4">Fixture Details</h2>
      <p>Match Date: <%= @bet.fixture.match_date %></p>
      <p>Match Time: <%= @bet.fixture.match_time %></p>
      <p>Team 1: <%= @bet.fixture.team1.name %></p>
      <p>Team 2: <%= @bet.fixture.team2.name %></p>
    </div>

    <button class="w-full bg-red-500 hover:bg-red-700 text-white font-bold py-2 px-4 rounded mt-6 transition duration-200 ease-in-out transform hover:scale-105" phx-click="cancel_bet" phx-value-bet_id ={@bet.id}>Cancel Bet</button>
  </div>
</div>
  """
end

def handle_event("cancel_bet", %{"bet_id"=>bet_id}, socket) do
  bet_id = String.to_integer(bet_id)
  Bets.delete_bet(bet_id)
        socket =
        socket |> put_flash(:info, "Bet Canceled Successfully")
        |> push_redirect(to: "/")
  {:noreply, socket}
end
end
