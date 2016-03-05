defmodule Traccow.WeightController do
  use Traccow.Web, :controller

  alias Traccow.Weight

  plug :scrub_params, "weight" when action in [:create, :update]

  def index(conn, _params) do
    weights = Repo.all(Weight)
    render(conn, "index.html", weights: weights)
  end

  def new(conn, _params) do
    changeset = Weight.changeset(%Weight{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"weight" => weight_params}) do
    changeset = Weight.changeset(%Weight{}, weight_params)

    case Repo.insert(changeset) do
      {:ok, _weight} ->
        conn
        |> put_flash(:info, "Weight created successfully.")
        |> redirect(to: weight_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    weight = Repo.get!(Weight, id)
    render(conn, "show.html", weight: weight)
  end

  def edit(conn, %{"id" => id}) do
    weight = Repo.get!(Weight, id)
    changeset = Weight.changeset(weight)
    render(conn, "edit.html", weight: weight, changeset: changeset)
  end

  def update(conn, %{"id" => id, "weight" => weight_params}) do
    weight = Repo.get!(Weight, id)
    changeset = Weight.changeset(weight, weight_params)

    case Repo.update(changeset) do
      {:ok, weight} ->
        conn
        |> put_flash(:info, "Weight updated successfully.")
        |> redirect(to: weight_path(conn, :show, weight))
      {:error, changeset} ->
        render(conn, "edit.html", weight: weight, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    weight = Repo.get!(Weight, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(weight)

    conn
    |> put_flash(:info, "Weight deleted successfully.")
    |> redirect(to: weight_path(conn, :index))
  end
end
