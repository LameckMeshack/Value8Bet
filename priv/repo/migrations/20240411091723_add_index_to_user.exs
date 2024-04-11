defmodule Value8.Repo.Migrations.AddIndexToUser do
  use Ecto.Migration

  def change do
    create unique_index(:users, [:username])
    create unique_index(:users, [:phone])
  end
end
