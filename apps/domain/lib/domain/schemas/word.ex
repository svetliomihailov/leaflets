defmodule Domain.Schemas.Word do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__
  alias Domain.Schemas.User

  schema "words" do
    belongs_to(:user, User)

    field(:spelling, :string)
    field(:description, :string, default: "")
    field(:times_used, :integer, default: 0)

    timestamps()
  end

  def changeset(params) do
    %Word{}
    |> cast(params, [:spelling, :description, :times_used, :user_id])
    |> validate_required([:spelling, :times_used])
    |> assoc_constraint(:user)
  end
end
