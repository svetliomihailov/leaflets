defmodule Domain.Repo.Migrations.CreatePlayers do
  use Ecto.Migration

  def change do
    create table(:players) do
      add(:user_id, references(:users, on_delete: :restrict), null: false)
      add(:game_id, references(:games, on_delete: :restrict), null: false)
      add(:team_id, references(:teams, on_delete: :restrict))
      add(:order, :smallint)

      timestamps()
    end
  end
end
