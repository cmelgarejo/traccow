defmodule Traccow.Repo.Migrations.CreateBreed do
  use Ecto.Migration

  def change do
    create table(:breed, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
