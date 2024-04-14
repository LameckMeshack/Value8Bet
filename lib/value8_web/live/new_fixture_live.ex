defmodule Value8Web.NewFixtureLive do
 use Phoenix.LiveComponent

alias Value8.Bets
alias Value8.Games
use Value8Web, :live_view
  def render(assigns) do
    ~H"""
    <div class="w-1/2">
    <h1 class="text-2xl font-semibold mb-4">New Fixture</h1>
    <div class="bg-white shadow-md rounded px-8 pt-6 pb-8 mb-4">
    <form phx-submit="submit_form">
      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="match_date">Match Date</label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
               id="match_date"
               name="match_date"
               type="date"
               required>
      </div>

      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="match_time">Match Time</label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
               id="match_time"
               name="match_time"
               type="time"
               required>
      </div>

      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="category">Category</label>
        <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                id="category"
                name="category_id"
                required>
          <%= for category <- @categories do %>

            <option value={category.id} ><%= category.name %></option>
          <% end %>
        </select>
      </div>

      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="team1">Team 1</label>
        <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                id="team1"
                name="team1_id"
                required>
          <%= for team <- @teams do %>
            <option value={team.id} ><%= team.name %></option>
          <% end %>
        </select>
      </div>

      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="team2">Team 2</label>
        <select class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
                id="team2"
                name="team2_id"
                required>
          <%= for team <- @teams do %>
            <option value={team.id} ><%= team.name %></option>
          <% end %>
        </select>
      </div>

      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="team1_odds">Team 1 Odds</label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
               id="team1_odds"
               name="team1_odds"
               type="number"
               step="0.01"
               required>
      </div>

      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="team2_odds">Team 2 Odds</label>
        <input class="shadow appearance-none border rounded w-full py-2 px-3 text-gray-700 leading-tight focus:outline-none focus:shadow-outline"
               id="team2_odds"
               name="team2_odds"
               type="number"
               step="0.01"
               required>

               </div>
               <div class="mb-4 bg-blue-700 rounded">
                 <button class="w-full p-4 " type="submit">Create Fixture</button>
                </div>
    </form>
    </div>
    </div>
    """
  end

def mount(_params, _session, socket) do

    {:ok, socket}
  end






end
