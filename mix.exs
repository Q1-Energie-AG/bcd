defmodule Bcd.MixProject do
  use Mix.Project

  @version "0.1.1"
  @source_url "https://github.com/Q1-Energie-AG/bcd"

  def project do
    [
      app: :bcd,
      version: @version,
      elixir: "~> 1.9",
      description: "A BCD encoder for Elixir",
      package: package(),
      deps: deps(),
      docs: [
        source_ref: "v#{@version}",
        main: "Bcd",
        source_url: @source_url
      ]
    ]
  end

  def package do
    [
      maintainers: ["Kevin Seidel"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => @source_url}
    ]
  end

  def application, do: []

  defp deps do
    [
      {:ex_doc, "~> 0.19", only: :docs, runtime: false},
    ]
  end
end
