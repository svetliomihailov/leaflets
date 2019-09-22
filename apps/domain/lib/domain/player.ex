defmodule Domain.Player do
  alias Domain.Schemas.{User, Player}
  alias Domain.Repo

  def create(params) do
    params
    |> Player.changeset()
    |> Repo.insert()
  end

  def all, do: Repo.all(Player)

  def find!(id), do: Repo.get!(Player, id)
end
