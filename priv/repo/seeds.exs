# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Value8.Repo.insert!(%Value8.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
# categories seeder
#


# teams seeder
# seach for category  name is "Football"
category = Value8.Repo.get_by(Value8.Games.Category, name: "Football")
for {name, abrrv} <- [
  {"Arsenal", "ARS"},
  {"Chelsea", "CHE"},
  {"Manchester United", "MNU"},
  {"Manchester City", "MNC"},
  {"Liverpool", "LIV"},
  {"Tottenham Hotspur", "TOT"}
] do
  {:ok, _} = Value8.Games.create_team(%{name: name, abrrv: abrrv, category_id: category.id})
end


