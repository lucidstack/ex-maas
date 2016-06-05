defmodule Maas.Mixfile do
  use Mix.Project
  @version "0.0.1"

  def project do
    [app: :maas,
     version: @version,
     elixir: "~> 1.2",
     package: package,
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps,

     # Docs
     name: "MAAS",
     docs: [source_ref: "v#{@version}", main: "Maas",
            source_url: "https://github.com/lucidstack/ex-maas"]
   ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :poison, :httpoison]]
  end

  defp package do
    [maintainers: ["Andrea Rossi"],
     files: ["lib", "mix.exs", "README.md", "LICENSE"],
     licenses: ["MIT"],
     links: %{"Github" => "https://github.com/lucidstack/ex-maas"}]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:credo, "~> 0.3", only: [:dev, :test]},
     {:poison, "~> 2.1.0"},
     {:httpoison, "~> 0.8.3"},
     {:ex_doc, github: "elixir-lang/ex_doc", only: :dev},
     {:earmark, ">= 0.0.0", only: :dev}]
  end
end
