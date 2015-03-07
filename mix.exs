defmodule Dlist.Mixfile do
  use Mix.Project

  def project do
    [app: :dlist,
     version: "0.0.1",
     elixir: "~> 1.0",
     name: "dlist",
     source_url: "https://github.com/stocks29/dlist",
     homepage_url: "https://github.com/stocks29/dlist",
     description: description,
     package: package,
     deps: deps]
  end

  def description do
    """
    Deque implementations
    """
  end

  def package do
    [ contributors: ["Bob Stockdale"],
      licenses: ["MIT License"],
      links: %{
        "GitHub" => "https://github.com/stocks29/dlist.git", 
        "Docs" => "http://hexdocs.pm/dlist"
        }]
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
    [
      {:earmark, "~> 0.1", only: :dev},
      {:benchwarmer, "~> 0.0.2", only: :dev},
      {:ex_doc, "~> 0.7", only: :dev}
    ]
  end
end
