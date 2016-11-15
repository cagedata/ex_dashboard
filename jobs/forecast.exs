use Kitto.Job.DSL

job :forcast, every: {5, :minutes} do
  forecast = ExDashboard.APIs.ForecastIO.get Application.get_env(:ex_dashboard, :forecast_location)
  current_temp = forecast["currently"]["temperature"] |> Float.round |> trunc
  hour_summary = forecast["minutely"]["summary"]
  broadcast! :forecast, %{temperature: "#{current_temp}º", summary: hour_summary}
end
