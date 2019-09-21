defmodule Domain.User do
  alias Domain.Schemas.User
  alias Domain.Repo

  def all, do: Repo.all(User)

  def find!(id), do: Repo.get!(User, id)
end
