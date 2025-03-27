defmodule WeatherUsaTest do
  use ExUnit.Case
  doctest WeatherUsa

  test "greets the world" do
    assert WeatherUsa.hello() == :world
  end
end
