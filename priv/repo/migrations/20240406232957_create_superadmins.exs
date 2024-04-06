defmodule Value8.Repo.Migrations.CreateSuperadmins do
  use Ecto.Migration

  def change do
    create table(:superadmins) do
      
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:superadmins, [:user_id])
  end
end
