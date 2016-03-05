defmodule Traccow.PositionHistoryController do
  use Traccow.Web, :controller

  alias Traccow.PositionHistory

  plug :scrub_params, "position_history" when action in [:create, :update]

  def index(conn, _params) do
    position_history = Repo.all(PositionHistory)
    render(conn, "index.html", position_history: position_history)
  end

  def new(conn, _params) do
    changeset = PositionHistory.changeset(%PositionHistory{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"position_history" => position_history_params}) do
    changeset = PositionHistory.changeset(%PositionHistory{}, position_history_params)

    case Repo.insert(changeset) do
      {:ok, _position_history} ->
        conn
        |> put_flash(:info, "Position history created successfully.")
        |> redirect(to: position_history_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    position_history = Repo.get!(PositionHistory, id)
    render(conn, "show.html", position_history: position_history)
  end

  def edit(conn, %{"id" => id}) do
    position_history = Repo.get!(PositionHistory, id)
    changeset = PositionHistory.changeset(position_history)
    render(conn, "edit.html", position_history: position_history, changeset: changeset)
  end

  def update(conn, %{"id" => id, "position_history" => position_history_params}) do
    position_history = Repo.get!(PositionHistory, id)
    changeset = PositionHistory.changeset(position_history, position_history_params)

    case Repo.update(changeset) do
      {:ok, position_history} ->
        conn
        |> put_flash(:info, "Position history updated successfully.")
        |> redirect(to: position_history_path(conn, :show, position_history))
      {:error, changeset} ->
        render(conn, "edit.html", position_history: position_history, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    position_history = Repo.get!(PositionHistory, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(position_history)

    conn
    |> put_flash(:info, "Position history deleted successfully.")
    |> redirect(to: position_history_path(conn, :index))
  end
end
