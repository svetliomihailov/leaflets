defmodule Domain.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add(:name, :string, null: false)
      add(:score, :smallint, null: false)

      timestamps()
    end
  end
end
