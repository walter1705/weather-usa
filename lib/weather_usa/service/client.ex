defmodule WeatherUsa.Service.Client do
  @moduledoc """
  This module is a service:
   client HTTP to fetch from a extern API.
  """

  @user_agent [{"User-agent", "Elixir waltergranada17@gmail.com"}]
  @base_url "https://forecast.weather.gov/xml/current_obs/"
  @doc """
  Fetch the actual forecast from the public api sending the user-agent
  id.
  """
  def fetch_forecast(icao_code) do
    url = "#{@base_url}#{icao_code}.xml"

    HTTPoison.get(url, @user_agent)
    |> handle_response()
  end

  @doc """
  handle the response of the http request
  """
  def handle_response({:ok, %{status_code: 200, body: body}}),
    do: {:ok, body}

  def handle_response({:ok, %{status_code: _}}),
    do: {:ok, :not_found}

  def handle_response({:error, %{reason: reason}}),
    do: {:error, reason}
end
