defmodule WeatherUsa.Service.Parser do
  import SweetXml
  alias WeatherUsa.Schema

  @moduledoc """
    This module is a service:
    parse the fetched data from xml format to printable form.
  """
  def decode_response({:ok, :not_found}),
  do:
    (
      IO.puts("ICAO not found on the US review your petition.")
      System.halt(2)
    )

def decode_response({:ok, body}),
  do: parse_forecast(body)

def decode_response({:error, reason}),
  do:
    (
    IO.puts("""
    Error obtaining data.
    #{inspect(reason)}
    """)
    System.halt(2)
    )

  defp parse_forecast(xml) do
    xml
    |> xpath(~x"//current_observation"e)
    |> extract_data()
  end

  defp extract_data(node) do
    %Schema{
      location: node |> xpath(~x"./location/text()"s),
      station_id: node |> xpath(~x"./station_id/text()"s),
      observation_time: node |> xpath(~x"./observation_time/text()"s),
      weather: node |> xpath(~x"./weather/text()"s),
      temperature: node |> xpath(~x"./temperature_string/text()"s),
      humidity: node |> xpath(~x"./relative_humidity/text()"s) |> to_integer(),
      wind: node |> xpath(~x"./wind_string/text()"s),
      pressure: node |> xpath(~x"./pressure_string/text()"s),
      visibility: node |> xpath(~x"./visibility_mi/text()"s) |> to_float()
    }
  end



  defp to_integer(nil), do: nil
  defp to_integer(value), do: String.to_integer(value)

  defp to_float(nil), do: nil
  defp to_float(value), do: String.to_float(value)
end
