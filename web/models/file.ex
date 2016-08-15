defmodule Traccow.File do
  use Traccow.Web, :model

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id

  schema "files" do
    field :code, :string
    field :notes, :string
    field :image, :string
    field :breed_id, :integer

    belongs_to :client, Traccow.Client
    has_one  :breed, Traccow.Breed, on_delete: :delete_all
    has_many :event, Traccow.Event, on_delete: :delete_all
    has_many :weight, Traccow.Weight, on_delete: :delete_all
    has_many :position, Traccow.Position, on_delete: :delete_all
    has_many :position_history, Traccow.PositionHistory, on_delete: :delete_all
    timestamps
  end

  @required_fields ~w(code client_id)
  @optional_fields ~w(notes image breed_id)

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
