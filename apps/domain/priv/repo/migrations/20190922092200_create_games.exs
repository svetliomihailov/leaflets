defmodule Domain.Repo.Migrations.CreateGames do
  use Ecto.Migration

  def change do
    create table(:games) do
      add(:gamemaster_id, references(:users, on_delete: :restrict), null: false)
      add(:codename, :string, null: false)
      add(:team_size, :smallint, null: false)
      add(:leaflets_per_player, :smallint, null: false)
      add(:seconds_per_turn, :smallint, null: false)
      add(:status, :smallint, null: false, default: 0)

      timestamps()
    end
  end
end
