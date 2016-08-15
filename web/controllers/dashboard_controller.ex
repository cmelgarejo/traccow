defmodule Traccow.DashboardController do
  use Traccow.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def grid_data(conn, _params) do
    #try do
      files = Repo.all(from f in Traccow.File,
        join: c in assoc(f, :client),
        #where: c.user_id == ^session.id and a.status == false,
        preload: [client: c])
      json(conn, files)
    # rescue
    #    _ in _ ->  conn |> put_flash(:error, gettext("An error has ocurred, please contact with the system administrator"))
    # end
  end

  defimpl Poison.Encoder, for: Traccow.Client do
    # This is a sigil that produces a list of atoms
    @attributes ~W(name)a

    def encode(client, _options) do
      client
      |> Map.take(@attributes)
      |> Poison.encode!
    end
  end

  defimpl Poison.Encoder, for: Traccow.File do
    # This is a sigil that produces a list of atoms
    @attributes ~W(id code notes)a

    def encode(file, _options) do
      file
      |> Map.take(@attributes)
      |> Poison.encode!
    end
  end

  defimpl Poison.Encoder, for: Traccow.Breed do
    # This is a sigil that produces a list of atoms
    @attributes ~W(name)a

    def encode(breed, _options) do
      breed
      |> Map.take(@attributes)
      |> Poison.encode!
    end
  end


end
