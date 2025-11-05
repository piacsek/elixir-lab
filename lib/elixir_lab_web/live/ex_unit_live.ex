defmodule ElixirLabWeb.ExUnitLive do
  use ElixirLabWeb, :live_view

  def handle_params(unsigned_params, uri, socket) do
    {:noreply, socket}
  end
end
