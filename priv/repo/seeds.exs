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
# alias Value8.Repo
# alias Value8.Games.Fixture
# alias Value8.Games.Team
# alias Value8.Games.Result
# alias Value8.Bets.Odds


# teams seeder
# seach for category  name is "Football"
# category = Value8.Repo.get_by(Value8.Games.Category, name: "Football")
# for {name, abrrv} <- [
#   {"Arsenal", "ARS"},
#   {"Chelsea", "CHE"},
#   {"Manchester United", "MNU"},
#   {"Manchester City", "MNC"},
#   {"Liverpool", "LIV"},
#   {"Tottenham Hotspur", "TOT"}
# ] do
#   {:ok, _} = Value8.Games.create_team(%{name: name, abrrv: abrrv, category_id: category.id})
# end


#Fixtures seeder
# Create a function to generate a random datetime within a range


# # Generate fixtures for the next 6 days
# for day <- 1..6 do
#   # Fetch teams
#   team1 = Repo.get!(Team, rem(day, 6) + 1)
#   team2 = Repo.get!(Team, rem(day + 1, 6) + 1)

#   # Insert a fixture
#   Repo.insert!(%Fixture{
#     match_date: DateTime.add(DateTime.utc_now(), day, :day) |> DateTime.to_date(),
#     match_time: ~T[12:00:00],
#     category_id: 1,
#     team1_id: team1.id,
#     team2_id: team2.id
#   })
# end


# Results seeder
# Fetch all fixtures
# fixtures = Repo.all(Fixture)

# # Generate results for each fixture
# Enum.each(fixtures, fn fixture ->
#   # Generate random scores
#   team1_score = Enum.random(0..5)
#   team2_score = Enum.random(0..5)

#   # Determine the result
#   result = cond do
#     team1_score > team2_score -> :team1
#     team1_score < team2_score -> :team2
#     true -> :draw
#   end

#   # Insert a result
#   Repo.insert!(%Result{
#     fixture_id: fixture.id,
#     team1_score: team1_score,
#     team2_score: team2_score,
#     result: result
#   })
# end)

# Odds seeder
# Fetch all fixtures
# fixtures = Repo.all(Fixture)

# # Generate odds for each fixture
# Enum.each(fixtures, fn fixture ->
#   # Generate random odds
#  # Generate random odds
# team1_odds = :rand.uniform() * 5 |> Float.round(2)
# team2_odds = :rand.uniform() * 5 |> Float.round(2)
# draw_odds = :rand.uniform() * 5 |> Float.round(2)

#   # Insert odds
#   Repo.insert!(%Odds{
#     fixture_id: fixture.id,
#     team1_odds: team1_odds,
#     team2_odds: team2_odds,
#     draw_odds: draw_odds
#   })
# end)

# Bets seeder

alias Value8.Repo
alias Value8.Bets.Bet
alias Value8.Accounts.User
alias Value8.Games.{Fixture, Team}

# Fetch all users, fixtures, and teams
users = Repo.all(User)
fixtures = Repo.all(Fixture)
teams = Repo.all(Team)

# Generate bets for each user
Enum.each(users, fn user ->
  # Fetch a random fixture and team
  fixture = Enum.random(fixtures)
  selected_team = Enum.random(teams)

  # Generate random amount and potential payout
  amount = :rand.uniform() * 100 |> Float.round(2)
  potential_payout = amount * Enum.random(1..5) |> Float.round(2)

  # Insert a bet
  Repo.insert!(%Bet{
    user_id: user.id,
    fixture_id: fixture.id,
    selected_team_id: selected_team.id,
    selected_result: Enum.random([:team1, :team2, :draw]),
    amount: amount,
    potential_payout: potential_payout,
    status: :pending,
    result: Enum.random([:team1, :team2, :draw])
  })
end)
