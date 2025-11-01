defmodule ElixirLabWeb.ConnCase do
  @moduledoc """
  This module defines the test case to be used by
  tests that require setting up a connection.

  Synchronous tests should be the exception, not the rule, so ConnCase enforces the tests run asynchronously for better long term maintainability & performance.
  """

  use ExUnit.CaseTemplate

  using opts do
    quote do
      if unquote(opts)[:async] == false do
        raise "async: false is not supported by ElixirLabWeb.ConnCase"
      end

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
