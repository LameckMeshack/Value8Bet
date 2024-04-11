
defmodule Value8.Repo.Migrations.AddFieldsToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :first_name, :string, null: false, default: "DefaultJohn"
      add :last_name, :string, null: false, default: "DefaultJane"
      add :phone, :string, null: false, default: "0000000000"
    end
  end
end
