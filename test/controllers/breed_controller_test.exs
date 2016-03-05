defmodule Traccow.BreedControllerTest do
  use Traccow.ConnCase

  alias Traccow.Breed
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, breed_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing breed"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, breed_path(conn, :new)
    assert html_response(conn, 200) =~ "New breed"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, breed_path(conn, :create), breed: @valid_attrs
    assert redirected_to(conn) == breed_path(conn, :index)
    assert Repo.get_by(Breed, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, breed_path(conn, :create), breed: @invalid_attrs
    assert html_response(conn, 200) =~ "New breed"
  end

  test "shows chosen resource", %{conn: conn} do
    breed = Repo.insert! %Breed{}
    conn = get conn, breed_path(conn, :show, breed)
    assert html_response(conn, 200) =~ "Show breed"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, breed_path(conn, :show, "11111111-1111-1111-1111-111111111111")
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    breed = Repo.insert! %Breed{}
    conn = get conn, breed_path(conn, :edit, breed)
    assert html_response(conn, 200) =~ "Edit breed"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    breed = Repo.insert! %Breed{}
    conn = put conn, breed_path(conn, :update, breed), breed: @valid_attrs
    assert redirected_to(conn) == breed_path(conn, :show, breed)
    assert Repo.get_by(Breed, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    breed = Repo.insert! %Breed{}
    conn = put conn, breed_path(conn, :update, breed), breed: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit breed"
  end

  test "deletes chosen resource", %{conn: conn} do
    breed = Repo.insert! %Breed{}
    conn = delete conn, breed_path(conn, :delete, breed)
    assert redirected_to(conn) == breed_path(conn, :index)
    refute Repo.get(Breed, breed.id)
  end
end
