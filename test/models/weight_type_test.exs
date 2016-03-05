defmodule Traccow.WeightTypeTest do
  use Traccow.ModelCase

  alias Traccow.WeightType

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = WeightType.changeset(%WeightType{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = WeightType.changeset(%WeightType{}, @invalid_attrs)
    refute changeset.valid?
  end
end
