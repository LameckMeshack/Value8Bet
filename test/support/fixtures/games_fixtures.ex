defmodule Value8.GamesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Value8.Games` context.
  """

  @doc """
  Generate a unique category name.
  """
  def unique_category_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: unique_category_name()
      })
      |> Value8.Games.create_category()

    category
  end

  @doc """
  Generate a unique team abrrv.
  """
  def unique_team_abrrv, do: "some abrrv#{System.unique_integer([:positive])}"

  @doc """
  Generate a unique team name.
  """
  def unique_team_name, do: "some name#{System.unique_integer([:positive])}"

  @doc """
  Generate a team.
  """
  def team_fixture(attrs \\ %{}) do
    {:ok, team} =
      attrs
      |> Enum.into(%{
        abrrv: unique_team_abrrv(),
        name: unique_team_name()
      })
      |> Value8.Games.create_team()

    team
  end

  @doc """
  Generate a fixture.
  """
  def fixture_fixture(attrs \\ %{}) do
    {:ok, fixture} =
      attrs
      |> Enum.into(%{
        match_date: ~U[2024-04-08 20:55:00Z],
        match_time: ~T[14:00:00]
      })
      |> Value8.Games.create_fixture()

    fixture
  end
end
