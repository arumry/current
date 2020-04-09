defmodule Current.Test.Repo do
  use Ecto.Repo,
    otp_app: :current,
    adapter: Ecto.Adapters.Postgres

  use Current
end
