defmodule Nets.Repo do
  use Ecto.Repo,
    otp_app: :nets,
    adapter: Ecto.Adapters.Postgres
end
