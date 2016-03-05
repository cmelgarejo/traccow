defmodule Traccow.WeightControllerTest do
  use Traccow.ConnCase

  alias Traccow.Weight
  @valid_attrs %{weight: "120.5", weight_date: "2010-04-17 14:00:00"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, weight_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing weights"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, weight_path(conn, :new)
    assert html_response(conn, 200) =~ "New weight"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, weight_path(conn, :create), weight: @valid_attrs
    assert redirected_to(conn) == weight_path(conn, :index)
    assert Repo.get_by(Weight, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, weight_path(conn, :create), weight: @invalid_attrs
    assert html_response(conn, 200) =~ "New weight"
  end

  test "shows chosen resource", %{conn: conn} do
    weight = Repo.insert! %Weight{}
    conn = get conn, weight_path(conn, :show, weight)
    assert html_response(conn, 200) =~ "Show weight"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, weight_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    weight = Repo.insert! %Weight{}
    conn = get conn, weight_path(conn, :edit, weight)
    assert html_response(conn, 200) =~ "Edit weight"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    weight = Repo.insert! %Weight{}
    conn = put conn, weight_path(conn, :update, weight), weight: @valid_attrs
    assert redirected_to(conn) == weight_path(conn, :show, weight)
    assert Repo.get_by(Weight, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    weight = Repo.insert! %Weight{}
    conn = put conn, weight_path(conn, :update, weight), weight: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit weight"
  end

  test "deletes chosen resource", %{conn: conn} do
    weight = Repo.insert! %Weight{}
    conn = delete conn, weight_path(conn, :delete, weight)
    assert redirected_to(conn) == weight_path(conn, :index)
    refute Repo.get(Weight, weight.id)
  end
end
