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
for name <- ["Football", "Rugby", "Boxing", "Basket Ball", "Hockey"] do
  {:ok, _} = Value8.Games.create_category(%{name: name})
end
