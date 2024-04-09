defmodule Value8.BetsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Value8.Bets` context.
  """

  @doc """
  Generate a odds.
  """
  def odds_fixture(attrs \\ %{}) do
    {:ok, odds} =
      attrs
      |> Enum.into(%{
        draw_odds: "120.5",
        team1_odds: "120.5",
        team2_odds: "120.5"
      })
      |> Value8.Bets.create_odds()

    odds
  end
end
