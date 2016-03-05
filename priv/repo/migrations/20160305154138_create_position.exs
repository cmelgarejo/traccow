defmodule Traccow.Repo.Migrations.CreatePosition do
  use Ecto.Migration

  def change do
    create table(:positions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :lat, :float
      add :lon, :float
      add :position_at, :datetime

      timestamps
    end

  end
end
