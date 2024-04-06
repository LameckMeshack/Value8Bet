defmodule Value8.Repo.Migrations.CreateAdmins do
  use Ecto.Migration

  def change do
    create table(:admins) do

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:admins, [:user_id])
  end
end
