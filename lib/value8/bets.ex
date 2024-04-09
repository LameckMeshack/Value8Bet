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

  alias Value8.Bets.Bet

  @doc """
  Returns the list of bets.

  ## Examples

      iex> list_bets()
      [%Bet{}, ...]

  """
  def list_bets do
    Repo.all(Bet)
  end

  @doc """
  Gets a single bet.

  Raises `Ecto.NoResultsError` if the Bet does not exist.

  ## Examples

      iex> get_bet!(123)
      %Bet{}

      iex> get_bet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bet!(id), do: Repo.get!(Bet, id)

  @doc """
  Creates a bet.

  ## Examples

      iex> create_bet(%{field: value})
      {:ok, %Bet{}}

      iex> create_bet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bet(attrs \\ %{}) do
    %Bet{}
    |> Bet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bet.

  ## Examples

      iex> update_bet(bet, %{field: new_value})
      {:ok, %Bet{}}

      iex> update_bet(bet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bet(%Bet{} = bet, attrs) do
    bet
    |> Bet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bet.

  ## Examples

      iex> delete_bet(bet)
      {:ok, %Bet{}}

      iex> delete_bet(bet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bet(%Bet{} = bet) do
    Repo.delete(bet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bet changes.

  ## Examples

      iex> change_bet(bet)
      %Ecto.Changeset{data: %Bet{}}

  """
  def change_bet(%Bet{} = bet, attrs \\ %{}) do
    Bet.changeset(bet, attrs)
  end
end
