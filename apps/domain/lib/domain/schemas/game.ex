defmodule Domain.Schemas.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Domain.Schemas.User
  alias Domain.Ecto.GameStatus

  schema "games" do
    belongs_to(:gamemaster, User)

    field(:codename, :string)
    field(:team_size, :integer, default: 2)
    field(:leaflets_per_player, :integer, default: 5)
    field(:seconds_per_turn, :integer, default: 60)
    field(:status, GameStatus, default: :new)

    timestamps()
  end

  def changeset(params) do
    %Game{}
    |> cast(params, [
      :codename,
      :team_size,
      :leaflets_per_player,
      :seconds_per_turn,
      :gamemaster_id
    ])
    |> validate_required([:codename, :team_size, :leaflets_per_player, :seconds_per_turn])
    |> validate_number(:team_size, greater_than_or_equal_to: 2)
    |> validate_number(:leaflets_per_player, greater_than_or_equal_to: 1)
    |> validate_number(:seconds_per_turn, greater_than_or_equal_to: 10)
    |> assoc_constraint(:gamemaster)
  end
end
