defmodule MaasTest do
  use ExUnit.Case
  doctest Maas

  @expected_latest %Maas.Report{
    terrestrial_date: "2016-06-02",
    sol: 1359,
    ls: 162.0,
    min_temp: -76.0,
    min_temp_fahrenheit: -104.8,
    max_temp: -13.0,
    max_temp_fahrenheit: 8.6,
    pressure: 737.0,
    pressure_string: "Lower",
    abs_humidity: nil,
    wind_speed: nil,
    wind_direction: "--",
    atmo_opacity: "Sunny",
    season: "Month 6",
    sunrise: "2016-06-02T10:26:00Z",
    sunset: "2016-06-02T22:21:00Z"
  }
  test "latest/0 returns the latest weather entry" do
    assert @expected_latest == Maas.latest
  end

  test "archive/0 returns a map with a list of %Maas.Report{}" do
    assert %{count: _count, results: [%Maas.Report{} | _]} = Maas.archive
  end

  test "archive/1 filters and returns a list of %Maas.Report{}" do
    assert %{
      count: _count,
      results: [%Maas.Report{sol: 123}]
    } = Maas.archive(sol: 123)
  end

  test "archive/1 with an out-of-bound page number returns an empty results list" do
    assert %{
      count: 0,
      results: []
    } = Maas.archive(page: 24)
  end
end
