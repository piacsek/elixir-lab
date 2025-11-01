defmodule ElixirLabWeb.PageController do
  use ElixirLabWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
