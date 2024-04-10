defmodule Value8Web.PageController do
  use Value8Web, :controller

  def home(conn, _params) do
    # Get Categories
    categories = Value8.Games.list_categories()


    render(conn, :home, layout: false, categories: categories)
  end
end
