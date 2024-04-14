defmodule Value8Web.HomeLive do
  alias Value8.Games
 use Value8Web, :live_view



 def mount(_params, _session, socket) do
  categories = Games.list_categories()
    fixtures = Games.list_fixtures()
    results = Games.list_results()
    {:ok, assign(socket, categories: categories, fixtures: fixtures, results: results)}
 end

   def handle_event("bet_now", %{"id" => id}, socket) do
    {:noreply, push_redirect(socket, to: "/fixture/#{id}")}
  end

end
