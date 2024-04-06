defmodule Value8.Accounts.Superadmin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "superadmins" do

    belongs_to :user, Value8.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(superadmin, attrs) do
    superadmin
    # |> cast(attrs, [])
    # |> validate_required([])
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
    |> assoc_constraint(:user)
  end
end
