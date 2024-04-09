defmodule Value8.BetsTest do
  use Value8.DataCase

  alias Value8.Bets

  describe "odds" do
    alias Value8.Bets.Odds

    import Value8.BetsFixtures

    @invalid_attrs %{team1_odds: nil, team2_odds: nil, draw_odds: nil}

    test "list_odds/0 returns all odds" do
      odds = odds_fixture()
      assert Bets.list_odds() == [odds]
    end

    test "get_odds!/1 returns the odds with given id" do
      odds = odds_fixture()
      assert Bets.get_odds!(odds.id) == odds
    end

    test "create_odds/1 with valid data creates a odds" do
      valid_attrs = %{team1_odds: "120.5", team2_odds: "120.5", draw_odds: "120.5"}

      assert {:ok, %Odds{} = odds} = Bets.create_odds(valid_attrs)
      assert odds.team1_odds == Decimal.new("120.5")
      assert odds.team2_odds == Decimal.new("120.5")
      assert odds.draw_odds == Decimal.new("120.5")
    end

    test "create_odds/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bets.create_odds(@invalid_attrs)
    end

    test "update_odds/2 with valid data updates the odds" do
      odds = odds_fixture()
      update_attrs = %{team1_odds: "456.7", team2_odds: "456.7", draw_odds: "456.7"}

      assert {:ok, %Odds{} = odds} = Bets.update_odds(odds, update_attrs)
      assert odds.team1_odds == Decimal.new("456.7")
      assert odds.team2_odds == Decimal.new("456.7")
      assert odds.draw_odds == Decimal.new("456.7")
    end

    test "update_odds/2 with invalid data returns error changeset" do
      odds = odds_fixture()
      assert {:error, %Ecto.Changeset{}} = Bets.update_odds(odds, @invalid_attrs)
      assert odds == Bets.get_odds!(odds.id)
    end

    test "delete_odds/1 deletes the odds" do
      odds = odds_fixture()
      assert {:ok, %Odds{}} = Bets.delete_odds(odds)
      assert_raise Ecto.NoResultsError, fn -> Bets.get_odds!(odds.id) end
    end

    test "change_odds/1 returns a odds changeset" do
      odds = odds_fixture()
      assert %Ecto.Changeset{} = Bets.change_odds(odds)
    end
  end

  describe "bets" do
    alias Value8.Bets.Bet

    import Value8.BetsFixtures

    @invalid_attrs %{status: nil, result: nil, selected_result: nil, amount: nil, potential_payout: nil}

    test "list_bets/0 returns all bets" do
      bet = bet_fixture()
      assert Bets.list_bets() == [bet]
    end

    test "get_bet!/1 returns the bet with given id" do
      bet = bet_fixture()
      assert Bets.get_bet!(bet.id) == bet
    end

    test "create_bet/1 with valid data creates a bet" do
      valid_attrs = %{status: :pending, result: :team1, selected_result: :team1, amount: "120.5", potential_payout: "120.5"}

      assert {:ok, %Bet{} = bet} = Bets.create_bet(valid_attrs)
      assert bet.status == :pending
      assert bet.result == :team1
      assert bet.selected_result == :team1
      assert bet.amount == Decimal.new("120.5")
      assert bet.potential_payout == Decimal.new("120.5")
    end

    test "create_bet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Bets.create_bet(@invalid_attrs)
    end

    test "update_bet/2 with valid data updates the bet" do
      bet = bet_fixture()
      update_attrs = %{status: :won, result: :team2, selected_result: :team2, amount: "456.7", potential_payout: "456.7"}

      assert {:ok, %Bet{} = bet} = Bets.update_bet(bet, update_attrs)
      assert bet.status == :won
      assert bet.result == :team2
      assert bet.selected_result == :team2
      assert bet.amount == Decimal.new("456.7")
      assert bet.potential_payout == Decimal.new("456.7")
    end

    test "update_bet/2 with invalid data returns error changeset" do
      bet = bet_fixture()
      assert {:error, %Ecto.Changeset{}} = Bets.update_bet(bet, @invalid_attrs)
      assert bet == Bets.get_bet!(bet.id)
    end

    test "delete_bet/1 deletes the bet" do
      bet = bet_fixture()
      assert {:ok, %Bet{}} = Bets.delete_bet(bet)
      assert_raise Ecto.NoResultsError, fn -> Bets.get_bet!(bet.id) end
    end

    test "change_bet/1 returns a bet changeset" do
      bet = bet_fixture()
      assert %Ecto.Changeset{} = Bets.change_bet(bet)
    end
  end
end
