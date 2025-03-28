defmodule WeatherUsa.Schema do
  @moduledoc """
  This module only purpose is to work like a schema
  to stablish strict outpout format
  """
  defstruct [:location,
    :station_id,
    :observation_time,
    :weather,
    :temperature,
    :humidity,
    :wind,
    :pressure,
    :visibility ]

end
