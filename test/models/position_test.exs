defmodule Traccow.PositionTest do
  use Traccow.ModelCase

  alias Traccow.Position

  @valid_attrs %{lat: "120.5", lon: "120.5", position_at: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Position.changeset(%Position{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Position.changeset(%Position{}, @invalid_attrs)
    refute changeset.valid?
  end
end
