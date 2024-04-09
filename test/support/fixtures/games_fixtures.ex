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
end
