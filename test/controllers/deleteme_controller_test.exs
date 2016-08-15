defmodule Traccow.DeletemeControllerTest do
  use Traccow.ConnCase

  alias Traccow.Deleteme
  @valid_attrs %{name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, deleteme_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing deletemes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, deleteme_path(conn, :new)
    assert html_response(conn, 200) =~ "New deleteme"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, deleteme_path(conn, :create), deleteme: @valid_attrs
    assert redirected_to(conn) == deleteme_path(conn, :index)
    assert Repo.get_by(Deleteme, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, deleteme_path(conn, :create), deleteme: @invalid_attrs
    assert html_response(conn, 200) =~ "New deleteme"
  end

  test "shows chosen resource", %{conn: conn} do
    deleteme = Repo.insert! %Deleteme{}
    conn = get conn, deleteme_path(conn, :show, deleteme)
    assert html_response(conn, 200) =~ "Show deleteme"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, deleteme_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    deleteme = Repo.insert! %Deleteme{}
    conn = get conn, deleteme_path(conn, :edit, deleteme)
    assert html_response(conn, 200) =~ "Edit deleteme"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    deleteme = Repo.insert! %Deleteme{}
    conn = put conn, deleteme_path(conn, :update, deleteme), deleteme: @valid_attrs
    assert redirected_to(conn) == deleteme_path(conn, :show, deleteme)
    assert Repo.get_by(Deleteme, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    deleteme = Repo.insert! %Deleteme{}
    conn = put conn, deleteme_path(conn, :update, deleteme), deleteme: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit deleteme"
  end

  test "deletes chosen resource", %{conn: conn} do
    deleteme = Repo.insert! %Deleteme{}
    conn = delete conn, deleteme_path(conn, :delete, deleteme)
    assert redirected_to(conn) == deleteme_path(conn, :index)
    refute Repo.get(Deleteme, deleteme.id)
  end
end
