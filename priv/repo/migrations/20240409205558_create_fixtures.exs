defmodule Value8.Repo.Migrations.CreateFixtures do
  use Ecto.Migration

  def change do
    create table(:fixtures) do
      add :match_date, :date
      add :match_time, :time
      add :category_id, references(:categories, on_delete: :nothing)
      add :team1_id, references(:teams, on_delete: :nothing)
      add :team2_id, references(:teams, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:fixtures, [:category_id])
    create index(:fixtures, [:team1_id])
    create index(:fixtures, [:team2_id])
  end
end
