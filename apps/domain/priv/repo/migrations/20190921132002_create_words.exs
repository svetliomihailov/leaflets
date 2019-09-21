defmodule Domain.Repo.Migrations.CreateWords do
  use Ecto.Migration

  def change do
    create table(:words) do
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :spelling, :string, null: false
      add :description, :text, default: ""
      add :times_used, :integer, default: 0

      timestamps()
    end
  end
end
