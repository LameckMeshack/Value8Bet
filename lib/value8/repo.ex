defmodule Value8.Repo do
  use Ecto.Repo,
    otp_app: :value8,
    adapter: Ecto.Adapters.Postgres
end
