defmodule WeatherUsa.CLI do
  @moduledoc """
  Module where the CLI script works.
  """

  alias WeatherUsa.Service.{Client, Parser}
  alias WeatherUsa.Schema

  def main(argvs) do
    argvs
    |> parse_argvs()
    |> process()
  end

  @doc """
  Parse the arguments given by the user.
  returns the ICAO code of the location: {ICAO} does not accept more than 1 param.
  -h or -hh for the instructions
  """
  def parse_argvs(argvs) do
    OptionParser.parse(argvs,
      switches: [help: :boolean],
      aliases: [h: :help]
    )
    |> elem(1)
    |> handle_entry_args_response()
  end

  def handle_entry_args_response([icao]),
    do: {:ok, icao}

  def handle_entry_args_response(_),
    do: {:ok, :help}

  @doc """
  process the argument given
  """
  def process({:ok, :help}) do
    IO.puts("""
    You have to enter the ICAO code of your airport/place (rembember usa)
    example page: https://www.world-airport-codes.com/
    """)

    System.halt(2)
  end

  def process({:ok, icao}) do
    icao
    |> Client.fetch_forecast()
    |> Parser.decode_response()
    |> print()
  end

  defp print(%Schema{} = info) do
    info
    |> Map.from_struct()
    |> Enum.map(fn {atom, content} ->
     [["#{Atom.to_string(atom)}: #{content}"]]
    end)
    |> print_table([Information])
  end

  def print_table(rows, header) do
    TableRex.quick_render(rows, header)
    |> handle_table_response()
  end

  def handle_table_response({:ok, table}) do
    table |> IO.puts()
  end

  def handle_table_response({:error, reason}) do
    "Printing table eror: #{reason}" |> IO.puts()
  end
end
