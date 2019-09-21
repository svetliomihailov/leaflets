defmodule Domain.Schemas.User do
  use Ecto.Schema

  schema "users" do
    field(:username, :string)
    field(:password_hash, :string)

    timestamps()
  end
end
