defmodule Traccow.PositionHistoryControllerTest do
  use Traccow.ConnCase

  alias Traccow.PositionHistory
  @valid_attrs %{lat: "120.5", lon: "120.5", position_at: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, position_history_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing position history"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, position_history_path(conn, :new)
    assert html_response(conn, 200) =~ "New position history"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, position_history_path(conn, :create), position_history: @valid_attrs
    assert redirected_to(conn) == position_history_path(conn, :index)
    assert Repo.get_by(PositionHistory, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, position_history_path(conn, :create), position_history: @invalid_attrs
    assert html_response(conn, 200) =~ "New position history"
  end

  test "shows chosen resource", %{conn: conn} do
    position_history = Repo.insert! %PositionHistory{}
    conn = get conn, position_history_path(conn, :show, position_history)
    assert html_response(conn, 200) =~ "Show position history"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, position_history_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    position_history = Repo.insert! %PositionHistory{}
    conn = get conn, position_history_path(conn, :edit, position_history)
    assert html_response(conn, 200) =~ "Edit position history"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    position_history = Repo.insert! %PositionHistory{}
    conn = put conn, position_history_path(conn, :update, position_history), position_history: @valid_attrs
    assert redirected_to(conn) == position_history_path(conn, :show, position_history)
    assert Repo.get_by(PositionHistory, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    position_history = Repo.insert! %PositionHistory{}
    conn = put conn, position_history_path(conn, :update, position_history), position_history: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit position history"
  end

  test "deletes chosen resource", %{conn: conn} do
    position_history = Repo.insert! %PositionHistory{}
    conn = delete conn, position_history_path(conn, :delete, position_history)
    assert redirected_to(conn) == position_history_path(conn, :index)
    refute Repo.get(PositionHistory, position_history.id)
  end
end
