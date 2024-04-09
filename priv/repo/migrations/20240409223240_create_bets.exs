defmodule Value8.Repo.Migrations.CreateBets do
  use Ecto.Migration

  def change do
    create table(:bets) do
      add :selected_result, :string
      add :amount, :decimal
      add :potential_payout, :decimal
      add :status, :string
      add :result, :string
      add :user_id, references(:users, on_delete: :nothing)
      add :fixture_id, references(:fixtures, on_delete: :nothing)
      add :selected_team_id, references(:teams, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:bets, [:user_id])
    create index(:bets, [:fixture_id])
    create index(:bets, [:selected_team_id])
  end
end
