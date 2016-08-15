defmodule Traccow.Event do
  use Traccow.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "events" do
    field :notes, :string
    field :event_date, Ecto.DateTime

    belongs_to :file, Traccow.File
    timestamps
  end

  @required_fields ~w(notes event_date file_id)
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
