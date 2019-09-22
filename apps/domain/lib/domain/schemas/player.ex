defmodule Domain.Schemas.Player do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Domain.Schemas.{Game, Team, User}

  schema "players" do
    belongs_to(:user, User)
    belongs_to(:game, Game)
    belongs_to(:team, Team)

    field(:order, :integer)

    timestamps()
  end

  def changeset(params) do
    %Player{}
    |> cast(params, [:user_id, :game_id])
    |> validate_required([:user_id, :game_id])
    |> assoc_constraint(:user)
    |> assoc_constraint(:game)
  end
end
