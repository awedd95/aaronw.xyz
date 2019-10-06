defmodule ResumeWeb.UserResolver do
  alias ResumeWeb.{Repo, User}
  # We won't do anything with any arguments that are passed into this query for
  # now.
  def all(_args, _info) do
    {:ok, Repo.all(User)}
  end
end
