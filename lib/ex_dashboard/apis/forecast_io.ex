defmodule ExDashboard.APIs.ForecastIO do
  @units "us"

  def get(location) do
    url = "https://api.forecast.io/forecast/"
      <> Application.get_env(:ex_dashboard, :forecast_api_key)
      <> "/" <> location
      <> "?units=" <> @units
    HTTPoison.get!(url).body
    |> Poison.decode!
  end
end
