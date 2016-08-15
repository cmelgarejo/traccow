defmodule Traccow.WeightType do
  use Traccow.Web, :model

  schema "weight_types" do
    field :name, :string
    field :description, :string

    timestamps
  end

  @required_fields ~w(name)
  @optional_fields ~w(description)

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
