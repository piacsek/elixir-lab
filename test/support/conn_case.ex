defmodule ElixirLabWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Synchronous tests should be the exception, not the rule, so DataCase enforces the tests run asynchronously for better long term maintainability & performance.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      @endpoint ElixirLabWeb.Endpoint

      use ExUnit.Case, async: true
      use ElixirLabWeb, :verified_routes

      import Plug.Conn
      import Phoenix.ConnTest
      import ElixirLabWeb.ConnCase
    end
  end

  setup do
    {:ok, conn: Phoenix.ConnTest.build_conn()}
  end
end
