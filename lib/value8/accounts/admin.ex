defmodule Value8.Accounts.Admin do
  use Ecto.Schema
  import Ecto.Changeset

  schema "admins" do

    belongs_to :user, Value8.Accounts.User
    has_many :permissions, Value8.Accounts.Permission

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:user_id])
    |> validate_required([:user_id])
    |> assoc_constraint(:user)
  end
end
