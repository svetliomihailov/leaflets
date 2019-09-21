defmodule Domain.MixProject do
  use Mix.Project

  def project do
    [
      app: :domain,
      version: "0.1.0",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :postgrex, :ecto],
      mod: {Domain.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ecto, "~> 3.2.0"},
      {:ecto_sql, "~> 3.0"},
      {:postgrex, ">= 0.0.0"}
    ]
  end

  defp aliases do
    [
      "ecto.setup": [
        "ecto.create -r Domain.Repo",
        "ecto.migrate -r Domain.Repo",
        "run priv/repo/seeds.exs"
      ],
      "ecto.reset": ["ecto.drop -r Domain.Repo", "ecto.setup"],
      test: ["ecto.create --quiet -r Domain.Repo", "ecto.migrate -r Domain.Repo", "test"]
    ]
  end
end
