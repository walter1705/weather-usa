defmodule WeatherUsa.MixProject do
  use Mix.Project

  def project do
    [
      app: :weather_usa,
      name: "weather on USA within ICAO codes",
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:sweet_xml, "~> 0.7.5"}, #XML decoder
      {:httpoison, "~> 2.2"}, #HTTP request
      {:ex_doc, "~> 0.37.3"}, #Documentation generator
      {:earmark, "~> 1.4"}, #Markdown to html in ex_doc
      {:table_rex, "~> 4.1"} #Format Tables for print
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp escript_config() do
    [
      main_module: WeatherUsa.CLI
    ]
  end
end
