defmodule Traccow.Repo.Migrations.CreateFile do
  use Ecto.Migration

  def change do
    create table(:files, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :code, :string
      add :notes, :string

      timestamps
    end

  end
end
