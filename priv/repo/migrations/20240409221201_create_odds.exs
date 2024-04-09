defmodule Value8.Repo.Migrations.CreateOdds do
  use Ecto.Migration

  def change do
    create table(:odds) do
      add :team1_odds, :decimal
      add :team2_odds, :decimal
      add :draw_odds, :decimal
      add :fixture_id, references(:fixtures, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:odds, [:fixture_id])
  end
end
