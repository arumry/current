defmodule Current.Mixfile do
  use Mix.Project

  @version File.read!("VERSION") |> String.trim_trailing()
  @source "https://github.com/bloodhawk/current"

  def project do
    [
      app: :current,
      elixir: "~> 1.9",
      elixirc_paths: elixirc_paths(Mix.env()),
      config_path: "config/config.exs",
      build_path: "_build",
      deps_path: "_deps",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      name: "Current for Ecto",
      description: "Better streaming for Ecto.",
      version: @version,
      docs: docs(),
      homepage_url: @source,
      source_url: @source,
      test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [applications: applications(Mix.env())]
  end

  defp applications(:test), do: [:postgrex, :ecto, :logger]
  defp applications(_), do: [:ecto, :logger]

  defp deps do
    [
      {:ecto_sql, "~> 3.0"},

      # Testing
      {:postgrex, "~> 0.15.0"},
      {:excoveralls, "~> 0.10.6", only: :test},
      {:inch_ex, "~> 2.0.0", only: [:dev, :docs]},

      # Documentation
      {:ex_doc, "~> 0.19", only: [:dev, :docs]},
      {:earmark, "~> 1.3", only: [:dev, :docs]}
    ]
  end

  defp elixirc_paths(_), do: ~W{lib}

  defp package do
    [
      maintainers: ["Aaron Rumery"],
      licenses: ["Public Domain"],
      links: %{"Github" => @source},
      files: ~w(lib mix.exs README.md LICENSE CHANGELOG.md VERSION)
    ]
  end

  defp docs do
    [
      main: "Current",
      canonical: "http://hexdocs.pm/current",
      source_ref: "v#{@version}",
      source_url: @source,
      extras: ~W{README.md CHANGELOG.md}
    ]
  end
end
