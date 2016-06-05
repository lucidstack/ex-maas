defmodule Maas do
  @moduledoc """
  This package (and module) is a thin wrapper around the MAAS (Mars Atmospheric
  Aggregation System) API. The API consists of two endpoints, `latest/0`, and
  `archive/1`, which (quite obviously) return the latest weather report, and a
  paginated list of old weather reports.

  For more information, visit [the MAAS website](http://marsweather.ingenology.com/).
  """

  @api_client Application.get_env(:maas, :api_client, HTTPoison)
  @maas_base_url "http://marsweather.ingenology.com/v1"

  @spec latest :: Maas.Report.t
  @doc """
  Calls the MAAS API and returns a `%Maas.Report{}` struct, containing the
  latest Mars weather report.
  """
  def latest do
    @maas_base_url <> "/latest/"
    |> get_and_parse_body
    |> Map.get(:report)
    |> to_report_struct
  end

  @spec archive     :: %{count: non_neg_integer(), results: [Maas.Report.t]}
  @spec archive([]) :: %{count: non_neg_integer(), results: [Maas.Report.t]}
  @doc """
  Calls the MAAS API and returns a map with `count` and `results`. `results` is
  a list of `%Maas.Report{}` structs.

  `archive/1` can also be called by passing parameters, to filter out results.

  These filters are most of the reports' fields, but visit
  [the MAAS website](http://marsweather.ingenology.com/) for more information.
  """
  def archive(params \\ []) do
    @maas_base_url <> "/archive/"
    |> get_and_parse_body(params)
    |> case do
      %{count: count, results: results} -> %{count: count, results: Enum.map(results, &to_report_struct/1)}
      _response ->                         %{count: 0,     results: []}
    end
  end

  # Private implementation
  ########################
  defp get_and_parse_body(url, params \\ []) do
    url
    |> @api_client.get!(%{}, [params: params])
    |> Map.get(:body)
    |> Poison.decode!(keys: :atoms)
  end

  defp to_report_struct(map) do
    struct(Maas.Report, map)
  end
end
