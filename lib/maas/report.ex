defmodule Maas.Report do
  @moduledoc """
  The module containing the struct for the Mars weather reports.
  """
  defstruct [
    :terrestrial_date, :sol, :ls,
    :min_temp, :min_temp_fahrenheit, :max_temp, :max_temp_fahrenheit,
    :pressure, :pressure_string, :abs_humidity,
    :wind_speed, :wind_direction,
    :atmo_opacity, :season,
    :sunrise, :sunset
  ]

  @type t :: %__MODULE__{}
end

