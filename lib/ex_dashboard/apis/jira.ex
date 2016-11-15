defmodule ExDashboard.APIs.Jira do
  def incidents(filter) do
    jql = URI.encode "filter=" <> filter
    url = URI.parse Application.get_env(:ex_dashboard, :jira_url) <> "/rest/api/2/search?jql=" <> jql
    headers = ["Authorization": "Basic " <> Application.get_env(:ex_dashboard, :jira_auth)]
    HTTPoison.get!(url, headers).body
    |> Poison.decode!
  end

  def count(incidents) do
    incidents["total"]
  end
end
