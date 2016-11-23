defmodule Yellow5.PageController do
  use Yellow5.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
