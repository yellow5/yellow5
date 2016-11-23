defmodule Yellow5.PageControllerTest do
  use Yellow5.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "<div id=\"yellow5\">5</div>"
  end
end
