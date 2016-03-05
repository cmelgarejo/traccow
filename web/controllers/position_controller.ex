defmodule Traccow.PositionController do
  use Traccow.Web, :controller

  alias Traccow.Position

  plug :scrub_params, "position" when action in [:create, :update]

  def index(conn, _params) do
    positions = Repo.all(Position)
    render(conn, "index.html", positions: positions)
  end

  def new(conn, _params) do
    changeset = Position.changeset(%Position{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"position" => position_params}) do
    changeset = Position.changeset(%Position{}, position_params)

    case Repo.insert(changeset) do
      {:ok, _position} ->
        conn
        |> put_flash(:info, "Position created successfully.")
        |> redirect(to: position_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    position = Repo.get!(Position, id)
    render(conn, "show.html", position: position)
  end

  def edit(conn, %{"id" => id}) do
    position = Repo.get!(Position, id)
    changeset = Position.changeset(position)
    render(conn, "edit.html", position: position, changeset: changeset)
  end

  def update(conn, %{"id" => id, "position" => position_params}) do
    position = Repo.get!(Position, id)
    changeset = Position.changeset(position, position_params)

    case Repo.update(changeset) do
      {:ok, position} ->
        conn
        |> put_flash(:info, "Position updated successfully.")
        |> redirect(to: position_path(conn, :show, position))
      {:error, changeset} ->
        render(conn, "edit.html", position: position, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    position = Repo.get!(Position, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(position)

    conn
    |> put_flash(:info, "Position deleted successfully.")
    |> redirect(to: position_path(conn, :index))
  end
end
