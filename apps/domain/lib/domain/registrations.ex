defmodule Domain.Registrations do
  alias __MODULE__.User

  alias Domain.Repo

  def list_users, do: Repo.all(User)

  def create_user(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
