defmodule Traccow.Venue do
  use Traccow.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "venues" do
    field :code, :string
    field :name, :string
    field :lat, :float
    field :lon, :float
    field :detection_radius, :integer
    field :geofence, :string

    belongs_to :client, Traccow.Client
    timestamps
  end

  @required_fields ~w(code name geofence)
  @optional_fields ~w(client_id lat lon detection_radius)

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
