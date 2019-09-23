defmodule Domain.Schemas.Leaflet do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Domain.Schemas.Game

  schema "leaflets" do
    belongs_to(:game, Game)

    field(:word, :string)
    field(:guessed, :boolean, default: false)

    timestamps()
  end

  def changeset(params) do
    %Leaflet{}
    |> cast(params, [:word, :guessed, :game_id])
    |> validate_required([:word, :game_id])
    |> assoc_constraint(:game)
  end
end
