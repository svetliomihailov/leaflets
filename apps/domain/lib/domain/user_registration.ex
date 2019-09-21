defmodule Domain.UserRegistration do
  alias Domain.Schemas.UserRegistration
  alias Domain.Repo

  def create(params) do
    params
    |> UserRegistration.changeset()
    |> Repo.insert()
  end
end
