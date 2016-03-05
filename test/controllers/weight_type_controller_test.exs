defmodule Traccow.WeightTypeControllerTest do
  use Traccow.ConnCase

  alias Traccow.WeightType
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, weight_type_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing weighttypes"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, weight_type_path(conn, :new)
    assert html_response(conn, 200) =~ "New weight type"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, weight_type_path(conn, :create), weight_type: @valid_attrs
    assert redirected_to(conn) == weight_type_path(conn, :index)
    assert Repo.get_by(WeightType, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, weight_type_path(conn, :create), weight_type: @invalid_attrs
    assert html_response(conn, 200) =~ "New weight type"
  end

  test "shows chosen resource", %{conn: conn} do
    weight_type = Repo.insert! %WeightType{}
    conn = get conn, weight_type_path(conn, :show, weight_type)
    assert html_response(conn, 200) =~ "Show weight type"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, weight_type_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    weight_type = Repo.insert! %WeightType{}
    conn = get conn, weight_type_path(conn, :edit, weight_type)
    assert html_response(conn, 200) =~ "Edit weight type"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    weight_type = Repo.insert! %WeightType{}
    conn = put conn, weight_type_path(conn, :update, weight_type), weight_type: @valid_attrs
    assert redirected_to(conn) == weight_type_path(conn, :show, weight_type)
    assert Repo.get_by(WeightType, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    weight_type = Repo.insert! %WeightType{}
    conn = put conn, weight_type_path(conn, :update, weight_type), weight_type: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit weight type"
  end

  test "deletes chosen resource", %{conn: conn} do
    weight_type = Repo.insert! %WeightType{}
    conn = delete conn, weight_type_path(conn, :delete, weight_type)
    assert redirected_to(conn) == weight_type_path(conn, :index)
    refute Repo.get(WeightType, weight_type.id)
  end
end
