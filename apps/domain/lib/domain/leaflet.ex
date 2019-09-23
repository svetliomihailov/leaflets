defmodule Domain.Leaflet do
  alias Domain.Schemas.{Game, Leaflet}
  alias Domain.Repo

  def create(params) do
    params
    |> Leaflet.changeset()
    |> Repo.insert()
  end

  def all, do: Repo.all(Leaflet)

  def all(%Game{} = game) do
    Repo.get_by(Leaflet, game_id: game.id)
  end

  def find!(id), do: Repo.get!(Leaflet, id)
end
