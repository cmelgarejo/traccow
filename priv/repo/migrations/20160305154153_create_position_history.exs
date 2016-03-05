defmodule Traccow.Repo.Migrations.CreatePositionHistory do
  use Ecto.Migration

  def change do
    create table(:position_history, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :lat, :float
      add :lon, :float
      add :position_at, :datetime

      timestamps
    end

  end
end
