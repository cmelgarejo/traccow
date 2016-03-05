defmodule Traccow.EventTest do
  use Traccow.ModelCase

  alias Traccow.Event

  @valid_attrs %{event_date: "2010-04-17 14:00:00", notes: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
