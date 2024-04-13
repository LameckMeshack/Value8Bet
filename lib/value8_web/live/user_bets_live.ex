defmodule Value8Web.UserBetLive do
  use Value8Web, :live_view
  alias Value8.Bets

@impl true
def mount(_params, _session, socket) do
   user_id = socket.assigns.current_user.id

   #  get user bets
   bets = Bets.list_user_bets(user_id)

   socket = assign(socket, :bets, bets)

   {:ok, socket}
end

 @impl true
def render(assigns) do
  ~H"""
    <div class="container mx-auto px-4 py-8">
      <h1 class="text-3xl font-bold mb-6">Your Bets</h1>

      <%= for bet <- @bets do %>
        <div class="bg-white shadow-2xl rounded p-6 mb-4">
          <div class="flex items-center justify-between">
            <div class="flex flex-col">
              <h2 class="text-xl font-bold mb-2">Match Details</h2>
              <p>
                <span class="font-bold">Date:</span>
                <%= bet.fixture.match_date %>
              </p>
              <p>
                <span class="font-bold">Time:</span>
                <%= bet.fixture.match_time %>
              </p>
              <p>
                <span class="font-bold">Teams:</span>
                <%= bet.fixture.team1.name %> vs <%= bet.fixture.team2.name %>
              </p>
            </div>
            <div class="flex flex-col text-right">
              <h2 class="text-xl font-bold mb-2">Your Bet</h2>
              <p>
                <span class="font-bold">Selection:</span>
                <%= Atom.to_string(bet.selected_result) %> (<%= bet.selected_team.name %>)
              </p>
              <p>
                <span class="font-bold">Amount:</span>
                <%= bet.amount %>
              </p>
              <p>
                <span class="font-bold">Potential Payout:</span>
                <%= bet.potential_payout %>
              </p>
            </div>
          </div>
          <div class="text-right mt-4">
            <span class="text-gray-500">Status: <%= Atom.to_string(bet.status) %></span>
          </div>
        </div>
      <% end %>
    </div>
  """
end
end
