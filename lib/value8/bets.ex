defmodule Value8.Bets do
  @moduledoc """
  The Bets context.
  """

  import Ecto.Query, warn: false
  alias Value8.Repo

  alias Value8.Bets.Odds

  @doc """
  Returns the list of odds.

  ## Examples

      iex> list_odds()
      [%Odds{}, ...]

  """
  def list_odds do
    Repo.all(Odds)
  end

  @doc """
  Gets a single odds.

  Raises `Ecto.NoResultsError` if the Odds does not exist.

  ## Examples

      iex> get_odds!(123)
      %Odds{}

      iex> get_odds!(456)
      ** (Ecto.NoResultsError)

  """
  def get_odds!(id), do: Repo.get!(Odds, id)

  @doc """
  Creates a odds.

  ## Examples

      iex> create_odds(%{field: value})
      {:ok, %Odds{}}

      iex> create_odds(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_odds(attrs \\ %{}) do
    %Odds{}
    |> Odds.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a odds.

  ## Examples

      iex> update_odds(odds, %{field: new_value})
      {:ok, %Odds{}}

      iex> update_odds(odds, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_odds(%Odds{} = odds, attrs) do
    odds
    |> Odds.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a odds.

  ## Examples

      iex> delete_odds(odds)
      {:ok, %Odds{}}

      iex> delete_odds(odds)
      {:error, %Ecto.Changeset{}}

  """
  def delete_odds(%Odds{} = odds) do
    Repo.delete(odds)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking odds changes.

  ## Examples

      iex> change_odds(odds)
      %Ecto.Changeset{data: %Odds{}}

  """
  def change_odds(%Odds{} = odds, attrs \\ %{}) do
    Odds.changeset(odds, attrs)
  end
end
