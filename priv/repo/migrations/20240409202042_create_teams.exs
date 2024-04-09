defmodule Value8.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string
      add :abrrv, :string
      add :category_id, references(:categories, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:teams, [:abrrv])
    create unique_index(:teams, [:name])
  end
end
