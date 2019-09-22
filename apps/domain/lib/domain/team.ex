defmodule Domain.Team do
  alias Domain.Schemas.Team
  alias Domain.Repo

  def create(params) do
    params
    |> Team.changeset()
    |> Repo.insert()
  end

  def all, do: Repo.all(Team)

  def find!(id), do: Repo.get!(Team, id)
end
