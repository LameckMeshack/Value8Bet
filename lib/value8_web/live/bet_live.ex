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
   <div class="p-6 max-w-sm mx-auto bg-white rounded-xl shadow-md flex items-center space-x-4">
      <div>
        <div class="text-xl font-medium text-black">Bet Details</div>
        <p class="text-gray-500">Status: <%= @bet.status %></p>
        <p class="text-gray-500">Amount: <%= @bet.amount %></p>
        <p class="text-gray-500">Potential Payout: <%= @bet.potential_payout %></p>
        <p class="text-gray-500">Selected Team: <%= @bet.selected_team.name %></p>
        <p class="text-gray-500">Match Date: <%= @bet.fixture.match_date %></p>
        <p class="text-gray-500">Match Time: <%= @bet.fixture.match_time %></p>
      </div>
    </div>

  """
end
end
