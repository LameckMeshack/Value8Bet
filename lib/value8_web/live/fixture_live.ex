defmodule Value8Web.FixtureLive do
 use Phoenix.LiveComponent
  use Value8Web, :live_view

 def render(assigns) do
    ~H"""
    <div class="border rounded-lg mb-4 px-4 py-4 bg-white shadow-md">
      <div class="flex items-center mb-4">
        <div class="mr-4">
          <p class="text-gray-700 font-semibold">
            <%= @fixture.team1.name %> (<%= @fixture.team1.abrrv %>)
          </p>
        </div>
        <span class="text-gray-500 font-semibold">vs</span>
        <div class="ml-4">
          <p class="text-gray-700 font-semibold">
            <%= @fixture.team2.name %> (<%= @fixture.team2.abrrv %>)
          </p>
        </div>
      </div>
      <div class="flex justify-between mb-4">
        <p class="text-gray-700 font-semibold">
          <%= @fixture.match_date %> - <%= @fixture.match_time %>
        </p>
        <p class="text-gray-700 font-semibold">Odds</p>
      </div>
      <ul class="list-none pl-4">
        <li class="mb-2">
          <span class="text-gray-700"> <%= @fixture.team1.name %> (TOT): </span>
          <span class="font-bold ml-2"><%= @fixture.odds.team1_odds %></span>
        </li>
        <li class="mb-2">
          <span class="text-gray-700"> <%= @fixture.team2.name %> (ARS): </span>
          <span class="font-bold ml-2"><%= @fixture.odds.team2_odds %></span>
        </li>
        <li>
          <span class="text-gray-700">Draw:</span>
          <span class="font-bold ml-2"><%= @fixture.odds.draw_odds %></span>
        </li>
      </ul>
      <div class="flex justify-center mt-4">
        <button
        phx-click={show_modal("user-modal")}
         class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded" phx-click="bet_now">
          Bet Now
        </button>

              <.modal
    id="user-modal"
    >

   <%= inspect(@fixture) %>

  </.modal>
      </div>
    </div>
    """
 end

 def handle_event("bet_now", _value, socket) do
    # Handle the bet now action here
    {:noreply, socket}
 end
end
