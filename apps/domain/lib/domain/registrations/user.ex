defmodule Domain.Registrations.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "users" do
    field(:username, :string)
    field(:password_hash, :string)
    field(:password_salt, :string)

    timestamps()
  end

  def changeset(params) do
    %User{}
    |> cast(params, [:username])
    |> validate_required([:username])
    |> unique_constraint(:username)
  end
end
