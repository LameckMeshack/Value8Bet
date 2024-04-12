defmodule Value8Web.FixtureBetLive do
 use Phoenix.LiveView

 alias Value8.Games

# def mount(%{"id" => id}, socket) do
#   fixture = Games.get_fixture!(id)
#   socket = assign(socket, :fixture, fixture)
#   socket = assign(socket, :id, String.to_integer(id))
#   {:ok, socket}
# end
 def mount(params, _session, socket) do
    # Extract the id from the params
    id = Map.get(params, "id")
    # You can now use the id to fetch data or perform other operations
    # For example, fetching the fixture data based on the id
    fixture = Games.get_fixture!(id)
    # Assign the fixture data to the socket so it can be used in the template
    {:ok, assign(socket, :fixture, fixture)}
 end


#  def render(assigns) do
#     ~H"""
#      <div class="mx-auto max-w-sm">
#     <h1>
#     Test <%= inspect(@fixture) %>
#       vs
#     </h1>
#   </div>
#       """
#  end

 def handle_event("place_bet", %{"bet_option" => bet_option, "amount" => amount}, socket) do
    # Handle the bet placement logic here
    {:noreply, socket}
 end
end
