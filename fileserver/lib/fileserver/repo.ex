defmodule Fileserver.Repo do
  use Ecto.Repo,
    otp_app: :fileserver,
    adapter: Ecto.Adapters.Postgres
end
