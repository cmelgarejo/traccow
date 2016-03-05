defmodule Traccow.ClientTest do
  use Traccow.ModelCase

  alias Traccow.Client

  @valid_attrs %{"name": "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Client.changeset(%Client{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Client.changeset(%Client{}, @invalid_attrs)
    refute changeset.valid?
  end
end
