defmodule Traccow.Weight do
  use Traccow.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "weights" do
    field :weight, :float
    field :weight_date, Ecto.DateTime
    field :weight_type_id, :integer

    belongs_to :file, Traccow.File
    has_one :weight_type, Traccow.WeightType
    timestamps
  end

  @required_fields ~w(weight weight_date file_id weight_type_id)
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
