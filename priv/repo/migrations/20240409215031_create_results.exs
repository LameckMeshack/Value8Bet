defmodule Value8.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :team1_score, :integer
      add :team2_score, :integer
      add :result, :string
      add :fixture_id, references(:fixtures, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:results, [:fixture_id])
  end
end
