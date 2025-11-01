defmodule ElixirLabWeb.ErrorHTMLTest do
  use ElixirLabWeb.ConnCase

  import Phoenix.Template, only: [render_to_string: 4]

  test "renders 404.html" do
    assert render_to_string(ElixirLabWeb.ErrorHTML, "404", "html", []) == "Not Found"
  end

  test "renders 500.html" do
    assert render_to_string(ElixirLabWeb.ErrorHTML, "500", "html", []) == "Internal Server Error"
  end
end
