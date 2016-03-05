defmodule Traccow.FileControllerTest do
  use Traccow.ConnCase

  alias Traccow.File
  @valid_attrs %{code: "some content", notes: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, file_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing files"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, file_path(conn, :new)
    assert html_response(conn, 200) =~ "New file"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, file_path(conn, :create), file: @valid_attrs
    assert redirected_to(conn) == file_path(conn, :index)
    assert Repo.get_by(File, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, file_path(conn, :create), file: @invalid_attrs
    assert html_response(conn, 200) =~ "New file"
  end

  test "shows chosen resource", %{conn: conn} do
    file = Repo.insert! %File{}
    conn = get conn, file_path(conn, :show, file)
    assert html_response(conn, 200) =~ "Show file"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, file_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    file = Repo.insert! %File{}
    conn = get conn, file_path(conn, :edit, file)
    assert html_response(conn, 200) =~ "Edit file"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    file = Repo.insert! %File{}
    conn = put conn, file_path(conn, :update, file), file: @valid_attrs
    assert redirected_to(conn) == file_path(conn, :show, file)
    assert Repo.get_by(File, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    file = Repo.insert! %File{}
    conn = put conn, file_path(conn, :update, file), file: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit file"
  end

  test "deletes chosen resource", %{conn: conn} do
    file = Repo.insert! %File{}
    conn = delete conn, file_path(conn, :delete, file)
    assert redirected_to(conn) == file_path(conn, :index)
    refute Repo.get(File, file.id)
  end
end
