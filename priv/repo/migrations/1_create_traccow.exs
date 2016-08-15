defmodule Traccow.Repo.Migrations.CreateClient do
  use Ecto.Migration

  def up do
    drop_if_exists table :breed
    drop_if_exists table :weight_types
    drop_if_exists table :venues
    drop_if_exists table :events
    drop_if_exists table :weights
    drop_if_exists table :positions
    drop_if_exists table :position_history
    drop_if_exists table :files
    drop_if_exists table :clients

    create table(:weight_types) do
      add :name, :string
      add :description, :string

      timestamps
    end

    create table(:breed) do
      add :name, :string
      add :description, :string

      timestamps
    end

    create table(:clients, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string

      timestamps
    end

    create table(:venues, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :client_id, references(:clients, type: :binary_id, on_delete: :delete_all), null: false
      add :code, :string
      add :name, :string
      add :lat, :float
      add :lon, :float
      add :geofence, :string
      add :detection_radius, :integer

      timestamps
    end

    create table(:files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :breed_id, references(:breed, type: :integer, on_delete: :delete_all), null: false
      add :client_id, references(:clients, type: :binary_id, on_delete: :delete_all), null: false
      add :code, :string
      add :notes, :string

      timestamps
    end

    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :file_id, references(:files, type: :binary_id, on_delete: :delete_all), null: false
      add :notes, :string
      add :event_date, :datetime

      timestamps
    end

    create table(:weights, primary_key: false) do
      add :file_id, references(:files, type: :binary_id, on_delete: :delete_all), null: false
      add :weight, :float
      add :weight_date, :datetime

      timestamps
    end

    create table(:positions, primary_key: false) do
      add :file_id, references(:files, type: :binary_id, on_delete: :delete_all), null: false
      add :lat, :float
      add :lon, :float
      add :position_at, :datetime

      timestamps
    end

    create table(:position_history, primary_key: false) do
      add :file_id, references(:files, type: :binary_id, on_delete: :delete_all), null: false
      add :lat, :float
      add :lon, :float
      add :position_at, :datetime

      timestamps
    end

  end
end
