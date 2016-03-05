defmodule Traccow.PageController do
  use Traccow.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
