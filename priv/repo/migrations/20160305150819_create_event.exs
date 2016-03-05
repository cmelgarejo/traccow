defmodule Traccow.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :notes, :string
      add :event_date, :datetime

      timestamps
    end

  end
end
