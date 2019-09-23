defmodule Domain.Repo.Migrations.CreateLeaflets do
  use Ecto.Migration

  def change do
    create table(:leaflets) do
      add(:game_id, references(:games, on_delete: :delete_all), null: false)
      add(:word, :string, null: false)
      add(:guessed, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
