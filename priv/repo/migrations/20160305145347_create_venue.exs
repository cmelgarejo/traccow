defmodule Traccow.Repo.Migrations.CreateVenue do
  use Ecto.Migration

  def change do
    create table(:venues, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string
      add :name, :string
      add :lat, :float
      add :lon, :float
      add :detection_radius, :integer

      timestamps
    end

  end
end
