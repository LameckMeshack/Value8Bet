defmodule Value8.Repo.Migrations.CreatePermissions do
  use Ecto.Migration

  def change do
    create table(:permissions) do
      add :name, :string
      add :admin_id, references(:admins, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:permissions, [:admin_id])
  end
end
