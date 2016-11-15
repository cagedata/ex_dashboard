defmodule ExDashboard.APIs.Jira do
  def issues(filter) do
    jql = URI.encode "filter=" <> filter <> "+order+by+priority+DESC,updated+ASC"
    url = URI.parse Application.get_env(:ex_dashboard, :jira_url) <> "/rest/api/2/search?maxResults=25&jql=" <> jql
    headers = ["Authorization": "Basic " <> Application.get_env(:ex_dashboard, :jira_auth)]
    HTTPoison.get!(url, headers).body
    |> Poison.decode!
  end

  def count(issues) do
    issues["total"]
  end

  def issue_for_dashboard(issue) do
    %{
      summary: issue["fields"]["summary"],
      id: issue["key"],
      priority: issue["fields"]["priority"]
    }
  end
end
