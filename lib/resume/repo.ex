defmodule Resume.Repo do
  use Ecto.Repo,
    otp_app: :resume,
    adapter: Ecto.Adapters.Postgres
end
