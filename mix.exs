defmodule ExDashboard.Mixfile do
  use Mix.Project

  def project do
    [app: :ex_dashboard,
     version: "0.0.1",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [applications: [:logger, :kitto, :ex_victor_ops, :extwitter, :httpoison, :poison]]
  end

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:kitto, "~> 0.1.1"},
      {:ex_victor_ops, github: "cagedata/ex_victor_ops"},
      {:poison, "~> 3.0.0", override: true},
      {:extwitter, "~> 0.6"},
      {:oauth, github: "tim/erlang-oauth"},
      {:httpoison, "~> 0.9.0"},
      {:poison, "~> 3.0"}
    ]
  end
end
