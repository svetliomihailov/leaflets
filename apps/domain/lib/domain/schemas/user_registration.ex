defmodule Domain.Schemas.UserRegistration do
  use Ecto.Schema
  import Ecto.Changeset

  alias __MODULE__

  schema "users" do
    field(:username, :string)
    field(:password_hash, :string)
    field(:password, :string, virtual: true)
    field(:password_confirmation, :string, virtual: true)

    timestamps()
  end

  def changeset(params) do
    %UserRegistration{}
    |> cast(params, [:username, :password, :password_confirmation])
    |> validate_required([:username, :password, :password_confirmation])
    |> validate_confirmation(:password, message: "does not match password")
    |> unique_constraint(:username)
    |> put_hashed_password()
  end

  defp put_hashed_password(%{valid?: false} = changeset), do: changeset

  defp put_hashed_password(%{valid?: true} = changeset) do
    changeset
    |> put_change(:password_hash, Domain.Auth.hash_password(changeset.changes.password))
    |> put_change(:password, nil)
    |> put_change(:password_confirmation, nil)
  end

end
