defmodule Brewshare.Repo do
  use Ecto.Repo,
    otp_app: :brewshare,
    adapter: Ecto.Adapters.Postgres
end
