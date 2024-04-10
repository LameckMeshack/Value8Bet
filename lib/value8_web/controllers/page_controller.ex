defmodule Value8Web.PageController do
  use Value8Web, :controller

  def home(conn, _params) do
    # Get Categories
    categories = Value8.Games.list_categories()
    fixtures = Value8.Games.list_fixtures()

    # add socket
    render(conn, :home, layout: false, categories: categories, fixtures: fixtures)
  end

end
