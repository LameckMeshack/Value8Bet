defmodule Value8.Repo.Migrations.AddDeletedAtToMultipleTables do
  use Ecto.Migration

  def change do
    alter table(:bets) do
      add :deleted_at, :utc_datetime
    end

    alter table(:teams) do
      add :deleted_at, :utc_datetime
    end

    alter table(:results) do
      add :deleted_at, :utc_datetime
    end

    alter table(:odds) do
      add :deleted_at, :utc_datetime
    end

    alter table(:admins) do
      add :deleted_at, :utc_datetime
    end

    alter table(:permissions) do
      add :deleted_at, :utc_datetime
    end

    alter table(:fixtures) do
      add :deleted_at, :utc_datetime
    end

    alter table(:categories) do
      add :deleted_at, :utc_datetime
    end
  end
end
