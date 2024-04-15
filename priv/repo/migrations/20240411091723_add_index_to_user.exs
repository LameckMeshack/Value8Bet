defmodule Value8.Repo.Migrations.AddIndexToUser do
  use Ecto.Migration

#   def change do
#     create unique_index(:users, [:username])
#     create unique_index(:users, [:phone])
#   end
# end
  def change do
    execute """
    DO $$
    BEGIN
      IF NOT EXISTS (
        SELECT 1
        FROM   pg_class c
        JOIN   pg_namespace n ON n.oid = c.relnamespace
        WHERE  c.relname = 'users_username_index'
        AND    n.nspname = 'public'
      ) THEN
        CREATE UNIQUE INDEX users_username_index ON users (username);
      END IF;
    END $$;
    """

    execute """
    DO $$
    BEGIN
      IF NOT EXISTS (
        SELECT 1
        FROM   pg_class c
        JOIN   pg_namespace n ON n.oid = c.relnamespace
        WHERE  c.relname = 'users_phone_index'
        AND    n.nspname = 'public'
      ) THEN
        CREATE UNIQUE INDEX users_phone_index ON users (phone);
      END IF;
    END $$;
    """
  end
end
