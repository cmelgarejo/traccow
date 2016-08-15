defmodule Traccow.DeletemeTest do
  use Traccow.ModelCase

  alias Traccow.Deleteme

  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Deleteme.changeset(%Deleteme{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Deleteme.changeset(%Deleteme{}, @invalid_attrs)
    refute changeset.valid?
  end
end
