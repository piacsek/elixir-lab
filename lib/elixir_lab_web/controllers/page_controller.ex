defmodule ElixirLabWeb.PageController do
  use ElixirLabWeb, :controller

  def home(conn, _params) do
    random_id = :rand.uniform(1000)
    image_url = "https://picsum.photos/400/400?random=#{random_id}"

    render(conn, :home, image_url: image_url)
  end
end
