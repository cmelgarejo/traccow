defmodule Traccow.Repo.Migrations.CreateWeight do
  use Ecto.Migration

  def change do
    create table(:weights, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :weight, :float
      add :weight_date, :datetime

      timestamps
    end

  end
end
