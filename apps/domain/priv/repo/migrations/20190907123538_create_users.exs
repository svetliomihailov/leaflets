defmodule Domain.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table(:users) do
      add(:username, :string, size: 40, null: false)
      add(:password_hash, :string, null: false)

      timestamps()
    end

    create(unique_index(:users, [:username]))
  end

  def down do
    drop(table(:users))
  end
end
