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
end
