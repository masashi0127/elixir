defmodule KV.Mixfile do
  use Mix.Project

  def project do
    IO.puts Mix.env
    [app: :kv,
      version: "0.0.1",
      elixir: "~> 1.1-dev",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      test_try: test_try(Mix.env),
      deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type `mix help deps` for more examples and options
  defp deps do
    []
  end

  defp test_try(:prod), do: "I am prod"
  defp test_try(_), do: IO.puts "I'm not prod"
end
