defmodule Traccow.Repo.Migrations.CreateWeightType do
  use Ecto.Migration

  def change do
    create table(:weighttypes, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :description, :string

      timestamps
    end

  end
end
