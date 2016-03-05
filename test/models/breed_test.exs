defmodule Traccow.BreedTest do
  use Traccow.ModelCase

  alias Traccow.Breed

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Breed.changeset(%Breed{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Breed.changeset(%Breed{}, @invalid_attrs)
    refute changeset.valid?
  end
end
