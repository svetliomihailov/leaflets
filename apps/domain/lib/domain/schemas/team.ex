defmodule Domain.Schemas.Team do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "teams" do
    field(:name, :string)
    field(:score, :integer, default: 0)
    timestamps()
  end

  def changeset(params) do
    %Team{}
    |> cast(params, [:name, :score])
    |> validate_required([:name, :score])
    |> validate_number(:score, greater_than_or_equal_to: 0)
  end
end
