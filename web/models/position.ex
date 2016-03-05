defmodule Traccow.Position do
  use Traccow.Web, :model

  schema "positions" do
    field :lat, :float
    field :lon, :float
    field :position_at, Ecto.DateTime

    belongs_to :file, Traccow.File
    timestamps
  end

  @required_fields ~w(lat lon position_at)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
