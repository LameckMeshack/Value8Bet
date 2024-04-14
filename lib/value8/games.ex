defmodule Value8.Games do

  import Ecto.Query, warn: false
  alias Value8.Games.Result
  alias Value8.Repo

  # Category Methods

  alias Value8.Games.Category

  def list_categories do
    Repo.all(Category)
  end

# Team Methods

  alias Value8.Games.Team


  def list_teams do
    Repo.all(Team)
  end


  def create_team(attrs \\ %{}) do
    %Team{}
    |> Team.changeset(attrs)
    |> Repo.insert()
  end

  # Fixture Methods


  alias Value8.Games.Fixture


  def list_fixtures do
    Repo.all(Fixture)
    |> Repo.preload([:team1, :team2, :odds, :result])
  end

  def list_results do
    Repo.all(Result)
    |> Repo.preload(fixture: [:team1, :team2])
  end

 def get_fixture!(id) do
  fixture = Repo.get!(Fixture, id)
  fixture = Repo.preload(fixture, [:odds, :team1, :team2])
  fixture
end


  def create_fixture(attrs \\ %{}) do
    %Fixture{}
    |> Fixture.changeset(attrs)
    |> Repo.insert()
  end



  def delete_fixture(%Fixture{} = fixture) do
    Repo.delete(fixture)
  end


  alias Value8.Games.Result



  def create_result(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end

end
