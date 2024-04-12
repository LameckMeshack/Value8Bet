defmodule Value8Web.HomeLive do
  alias Value8.Games
 use Value8Web, :live_view



 def mount(_params, _session, socket) do
  categories = Games.list_categories()
    fixtures = Games.list_fixtures()
    {:ok, assign(socket, categories: categories, fixtures: fixtures)}
 end

end
