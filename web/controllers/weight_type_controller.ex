defmodule Traccow.WeightTypeController do
  use Traccow.Web, :controller

  alias Traccow.WeightType

  plug :scrub_params, "weight_type" when action in [:create, :update]

  def index(conn, _params) do
    weighttypes = Repo.all(WeightType)
    render(conn, "index.html", weighttypes: weighttypes)
  end

  def new(conn, _params) do
    changeset = WeightType.changeset(%WeightType{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"weight_type" => weight_type_params}) do
    changeset = WeightType.changeset(%WeightType{}, weight_type_params)

    case Repo.insert(changeset) do
      {:ok, _weight_type} ->
        conn
        |> put_flash(:info, "Weight type created successfully.")
        |> redirect(to: weight_type_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    weight_type = Repo.get!(WeightType, id)
    render(conn, "show.html", weight_type: weight_type)
  end

  def edit(conn, %{"id" => id}) do
    weight_type = Repo.get!(WeightType, id)
    changeset = WeightType.changeset(weight_type)
    render(conn, "edit.html", weight_type: weight_type, changeset: changeset)
  end

  def update(conn, %{"id" => id, "weight_type" => weight_type_params}) do
    weight_type = Repo.get!(WeightType, id)
    changeset = WeightType.changeset(weight_type, weight_type_params)

    case Repo.update(changeset) do
      {:ok, weight_type} ->
        conn
        |> put_flash(:info, "Weight type updated successfully.")
        |> redirect(to: weight_type_path(conn, :show, weight_type))
      {:error, changeset} ->
        render(conn, "edit.html", weight_type: weight_type, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    weight_type = Repo.get!(WeightType, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(weight_type)

    conn
    |> put_flash(:info, "Weight type deleted successfully.")
    |> redirect(to: weight_type_path(conn, :index))
  end
end
