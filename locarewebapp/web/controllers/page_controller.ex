defmodule Locarewebapp.PageController do
  use Locarewebapp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
