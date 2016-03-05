defmodule Traccow.WeightTest do
  use Traccow.ModelCase

  alias Traccow.Weight

  @valid_attrs %{weight: "120.5", weight_date: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Weight.changeset(%Weight{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Weight.changeset(%Weight{}, @invalid_attrs)
    refute changeset.valid?
  end
end
