defmodule Value8.Accounts.Permission do
  use Ecto.Schema
  import Ecto.Changeset

  schema "permissions" do
    field :name, :string
    field :deleted_at, :utc_datetime
    # field :admin_id, :id
    belongs_to :admin, Value8.Accounts.Admin

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(permission, attrs) do
    permission
    |> cast(attrs, [:name, :admin_id])
    |> validate_required([:name, :admin_id])
    |> unique_constraint(:name)
  end
end
