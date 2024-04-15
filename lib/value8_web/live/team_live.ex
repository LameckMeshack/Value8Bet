defmodule Value8Web.TeamLive do
 use Phoenix.LiveComponent

 alias Value8.  Games
 alias Value8.  Games.Team

 def mount(_params, socket) do
    changeset =   Games.change_team(%Team{})
    {:ok, assign(socket, changeset: changeset)}
 end

 def handle_event("save", %{"team" => team_params}, socket) do
    case  Games.create_or_update_team(team_params) do
      {:ok, team} ->
        {:noreply, socket |> put_flash(:info, "Team saved successfully.")}
      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
 end

 def render(assigns) do
    ~H"""
    <div  class="w-96">
      <form phx-submit="save">
            <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="name">
          Team Name
        </label>
        <input
          class="form-input mt-1 block w-full"
          type="text"
          name="name"
          id="name"
          required
        />
      </div>
      <div class="mb-4">
        <label class="block text-gray-700 text-sm font-bold mb-2" for="abbr">
          Abbreviation
        </label>
        <input
          class="form-input mt-1 block w-full"
          type="text"
          name="abbr"
          id="abbr"
          required
        />
      </div>



         <div class="flex bg-blue-800 items-center justify-between">
        <button
          class="bg-red-800 w-full font-bold py-2 px-4 rounded"
          type="submit"
        >
          Place Bet
        </button>
      </div>
      </form>
    </div>
    """
 end
  end
