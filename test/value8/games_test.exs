defmodule Value8.GamesTest do
  use Value8.DataCase

  alias Value8.Games

  describe "categories" do
    alias Value8.Games.Category

    import Value8.GamesFixtures

    @invalid_attrs %{name: nil}

    test "list_categories/0 returns all categories" do
      category = category_fixture()
      assert Games.list_categories() == [category]
    end

    test "get_category!/1 returns the category with given id" do
      category = category_fixture()
      assert Games.get_category!(category.id) == category
    end

    test "create_category/1 with valid data creates a category" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Category{} = category} = Games.create_category(valid_attrs)
      assert category.name == "some name"
    end

    test "create_category/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_category(@invalid_attrs)
    end

    test "update_category/2 with valid data updates the category" do
      category = category_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Category{} = category} = Games.update_category(category, update_attrs)
      assert category.name == "some updated name"
    end

    test "update_category/2 with invalid data returns error changeset" do
      category = category_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_category(category, @invalid_attrs)
      assert category == Games.get_category!(category.id)
    end

    test "delete_category/1 deletes the category" do
      category = category_fixture()
      assert {:ok, %Category{}} = Games.delete_category(category)
      assert_raise Ecto.NoResultsError, fn -> Games.get_category!(category.id) end
    end

    test "change_category/1 returns a category changeset" do
      category = category_fixture()
      assert %Ecto.Changeset{} = Games.change_category(category)
    end
  end

  describe "teams" do
    alias Value8.Games.Team

    import Value8.GamesFixtures

    @invalid_attrs %{name: nil, abrrv: nil}

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Games.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Games.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      valid_attrs = %{name: "some name", abrrv: "some abrrv"}

      assert {:ok, %Team{} = team} = Games.create_team(valid_attrs)
      assert team.name == "some name"
      assert team.abrrv == "some abrrv"
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      update_attrs = %{name: "some updated name", abrrv: "some updated abrrv"}

      assert {:ok, %Team{} = team} = Games.update_team(team, update_attrs)
      assert team.name == "some updated name"
      assert team.abrrv == "some updated abrrv"
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_team(team, @invalid_attrs)
      assert team == Games.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Games.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Games.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Games.change_team(team)
    end
  end

  describe "fixtures" do
    alias Value8.Games.Fixture

    import Value8.GamesFixtures

    @invalid_attrs %{match_date: nil, match_time: nil}

    test "list_fixtures/0 returns all fixtures" do
      fixture = fixture_fixture()
      assert Games.list_fixtures() == [fixture]
    end

    test "get_fixture!/1 returns the fixture with given id" do
      fixture = fixture_fixture()
      assert Games.get_fixture!(fixture.id) == fixture
    end

    test "create_fixture/1 with valid data creates a fixture" do
      valid_attrs = %{match_date: ~U[2024-04-08 20:55:00Z], match_time: ~T[14:00:00]}

      assert {:ok, %Fixture{} = fixture} = Games.create_fixture(valid_attrs)
      assert fixture.match_date == ~U[2024-04-08 20:55:00Z]
      assert fixture.match_time == ~T[14:00:00]
    end

    test "create_fixture/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_fixture(@invalid_attrs)
    end

    test "update_fixture/2 with valid data updates the fixture" do
      fixture = fixture_fixture()
      update_attrs = %{match_date: ~U[2024-04-09 20:55:00Z], match_time: ~T[15:01:01]}

      assert {:ok, %Fixture{} = fixture} = Games.update_fixture(fixture, update_attrs)
      assert fixture.match_date == ~U[2024-04-09 20:55:00Z]
      assert fixture.match_time == ~T[15:01:01]
    end

    test "update_fixture/2 with invalid data returns error changeset" do
      fixture = fixture_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_fixture(fixture, @invalid_attrs)
      assert fixture == Games.get_fixture!(fixture.id)
    end

    test "delete_fixture/1 deletes the fixture" do
      fixture = fixture_fixture()
      assert {:ok, %Fixture{}} = Games.delete_fixture(fixture)
      assert_raise Ecto.NoResultsError, fn -> Games.get_fixture!(fixture.id) end
    end

    test "change_fixture/1 returns a fixture changeset" do
      fixture = fixture_fixture()
      assert %Ecto.Changeset{} = Games.change_fixture(fixture)
    end
  end

  describe "results" do
    alias Value8.Games.Result

    import Value8.GamesFixtures

    @invalid_attrs %{result: nil, team1_score: nil, team2_score: nil}

    test "list_results/0 returns all results" do
      result = result_fixture()
      assert Games.list_results() == [result]
    end

    test "get_result!/1 returns the result with given id" do
      result = result_fixture()
      assert Games.get_result!(result.id) == result
    end

    test "create_result/1 with valid data creates a result" do
      valid_attrs = %{result: :team1, team1_score: 42, team2_score: 42}

      assert {:ok, %Result{} = result} = Games.create_result(valid_attrs)
      assert result.result == :team1
      assert result.team1_score == 42
      assert result.team2_score == 42
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Games.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()
      update_attrs = %{result: :team2, team1_score: 43, team2_score: 43}

      assert {:ok, %Result{} = result} = Games.update_result(result, update_attrs)
      assert result.result == :team2
      assert result.team1_score == 43
      assert result.team2_score == 43
    end

    test "update_result/2 with invalid data returns error changeset" do
      result = result_fixture()
      assert {:error, %Ecto.Changeset{}} = Games.update_result(result, @invalid_attrs)
      assert result == Games.get_result!(result.id)
    end

    test "delete_result/1 deletes the result" do
      result = result_fixture()
      assert {:ok, %Result{}} = Games.delete_result(result)
      assert_raise Ecto.NoResultsError, fn -> Games.get_result!(result.id) end
    end

    test "change_result/1 returns a result changeset" do
      result = result_fixture()
      assert %Ecto.Changeset{} = Games.change_result(result)
    end
  end
end
