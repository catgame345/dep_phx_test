defmodule Dep.Repo do
  use Ecto.Repo,
    otp_app: :dep,
    adapter: Ecto.Adapters.Postgres
end
