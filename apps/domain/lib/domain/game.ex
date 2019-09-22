defmodule Domain.Game do
  alias Domain.Schemas.Game
  alias Domain.Repo

  def create(params) do
    params
    |> Game.changeset()
    |> Repo.insert()
  end

  def all, do: Repo.all(Game)

  def find!(id), do: Repo.get!(Game, id)
end
