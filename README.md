# `ex-maas` - A wrapper for the Mars Atmospheric Weather System API

This package (and module) is a thin wrapper around the MAAS (Mars Atmospheric
Aggregation System) API.

The API consists of two endpoints, `latest/0`, and
`archive/1`, which (quite obviously) return the latest weather report, and a
paginated list of old weather reports.

For more information, visit [the MAAS website](http://marsweather.ingenology.com/).

## Installation

The usual stuff! Add `maas` to the `deps` in your `mix.exs`:
```elixir
def deps do
  [{:maas, "~> 0.0.1"}]
end
```
and to your applications:
```elixir
def application do
  [applications: [:maas]]
end
```
and you should be good to go! 🚀

## Usage

[Head to the hexdocs, captain! 🖖🏼](https://hexdocs.pm/maas/)
