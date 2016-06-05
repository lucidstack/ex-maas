defmodule Maas.Test.ApiClientMock do
  @base_url "http://marsweather.ingenology.com"

  # Latest report
  def get!(@base_url <> "/v1/latest/", _headers, _params) do
    %{body: File.read!("test/support/json/latest.json")}
  end

  # Archive with filter
  def get!(@base_url <> "/v1/archive/", _headers, [params: [sol: 123]]) do
    %{body: File.read!("test/support/json/archive_sol_123.json")}
  end

  # Archive with out-of-bound page number
  def get!(@base_url <> "/v1/archive/", _headers, [params: [page: 24]]) do
    %{body: File.read!("test/support/json/out_of_bound.json")}
  end

  # Archive
  def get!(@base_url <> "/v1/archive/", _headers, _params) do
    %{body: File.read!("test/support/json/archive.json")}
  end
end

