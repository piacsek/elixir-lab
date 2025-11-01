defmodule ElixirLab.DataCase do
  @moduledoc """
  This module defines the setup for tests requiring access to the application's data layer.

  Synchronous tests should be the exception, not the rule, so DataCase enforces the tests run asynchronously for better long term maintainability & performance.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      use ExUnit.Case, async: true

      alias ElixirLab.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query
      import ElixirLab.DataCase
    end
  end

  setup _tags do
    pid = Ecto.Adapters.SQL.Sandbox.start_owner!(ElixirLab.Repo)
    on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)
  end

  @doc """
  A helper that transforms changeset errors into a map of messages.

      assert {:error, changeset} = Accounts.create_user(%{password: "short"})
      assert "password is too short" in errors_on(changeset).password
      assert %{password: ["password is too short"]} = errors_on(changeset)

  """
  def errors_on(changeset) do
    Ecto.Changeset.traverse_errors(changeset, fn {message, opts} ->
      Regex.replace(~r"%{(\w+)}", message, fn _, key ->
        opts |> Keyword.get(String.to_existing_atom(key), key) |> to_string()
      end)
    end)
  end
end
