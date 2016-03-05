defmodule Traccow.BreedController do
  use Traccow.Web, :controller

  alias Traccow.Breed

  plug :scrub_params, "breed" when action in [:create, :update]

  def index(conn, _params) do
    breed = Repo.all(Breed)
    render(conn, "index.html", breed: breed)
  end

  def new(conn, _params) do
    changeset = Breed.changeset(%Breed{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"breed" => breed_params}) do
    changeset = Breed.changeset(%Breed{}, breed_params)

    case Repo.insert(changeset) do
      {:ok, _breed} ->
        conn
        |> put_flash(:info, "Breed created successfully.")
        |> redirect(to: breed_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    breed = Repo.get!(Breed, id)
    render(conn, "show.html", breed: breed)
  end

  def edit(conn, %{"id" => id}) do
    breed = Repo.get!(Breed, id)
    changeset = Breed.changeset(breed)
    render(conn, "edit.html", breed: breed, changeset: changeset)
  end

  def update(conn, %{"id" => id, "breed" => breed_params}) do
    breed = Repo.get!(Breed, id)
    changeset = Breed.changeset(breed, breed_params)

    case Repo.update(changeset) do
      {:ok, breed} ->
        conn
        |> put_flash(:info, "Breed updated successfully.")
        |> redirect(to: breed_path(conn, :show, breed))
      {:error, changeset} ->
        render(conn, "edit.html", breed: breed, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    breed = Repo.get!(Breed, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(breed)

    conn
    |> put_flash(:info, "Breed deleted successfully.")
    |> redirect(to: breed_path(conn, :index))
  end
end
