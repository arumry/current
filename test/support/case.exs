defmodule Current.Test.Case do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Current.Test.{Repo, Actor, Movie, Credit}

      import Ecto.Query

      import Current.Test.Case.Helpers
    end
  end

  setup context do
    if context[:db] do
      :ok = Ecto.Adapters.SQL.Sandbox.checkout(Current.Test.Repo)

      # Move into `Current.StreamerTest` cases?
      Ecto.Adapters.SQL.Sandbox.mode(Current.Test.Repo, {:shared, self()})

      # Toggle with different tag?
      Current.Test.Data.insert!()
    end
  end

  defmodule Helpers do
    def ascending?(rows, options \\ []), do: ordered?(rows, &>/2, options)
    def descending?(rows, options \\ []), do: ordered?(rows, &</2, options)

    defp ordered?(rows, comparer, options) do
      key = Keyword.get(options, :key, :id)

      {_, ordered} =
        Enum.reduce(rows, {nil, true}, fn
          %{^key => current}, {nil, true} -> {current, true}
          %{^key => current}, {_, false} -> {current, false}
          %{^key => current}, {prev, true} -> {current, comparer.(current, prev)}
        end)

      ordered
    end
  end
end
