defmodule Domain.Word do
  alias Domain.Schemas.{User, Word}
  alias Domain.Repo

  def create(params) do
    params
    |> Word.changeset()
    |> Repo.insert()
  end

  def all, do: Repo.all(Word)
  def all(%User{} = user) do
    Repo.get_by(Word, user_id: user.id)
  end

  def find!(id), do: Repo.get!(Word, id)
end
