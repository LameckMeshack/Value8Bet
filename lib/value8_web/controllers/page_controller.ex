defmodule Value8Web.PageController do
  use Value8Web, :controller

  def home(conn, _params) do
    # Get Categories
    categories = Value8.Games.list_categories()
    fixtures = Value8.Games.list_fixtures()


    render(conn, :home, layout: false, categories: categories, fixtures: fixtures)
  end

  # defp formatted_date(date) do
  #   date |> Date.to_string(%{:format => "%A, %B %d, %Y"})
  # end
end
