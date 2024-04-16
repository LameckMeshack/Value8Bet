defmodule Value8.Repo.Migrations.CreateProfitsTable do
  use Ecto.Migration

  def change do
     create table(:profits) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :bet_id, references(:bets, on_delete: :delete_all), null: false
      add :profit_amount, :decimal, null: false
      add :deleted_at, :utc_datetime

      timestamps()
    end

    create index(:profits, [:user_id])
    create index(:profits, [:bet_id])
  end
end
