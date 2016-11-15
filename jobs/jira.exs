use Kitto.Job.DSL

filters = [
  "service_desk_issues": "10300",
  "unassigned_issues": "10100"
]

job :open_jira_issues, every: {2, :minutes} do
  count = ExDashboard.APIs.Jira.incidents(filters[:service_desk_issues])
  |> ExDashboard.APIs.Jira.count

  broadcast! :service_desk_issue_count, %{value: count}
end

job :unassigned_jira_issues, every: {2, :minutes} do
  issues = ExDashboard.APIs.Jira.incidents(filters[:unassigned_issues])["issues"]
    |> Enum.map(fn(incident) ->
      %{ label: incident["fields"]["summary"], value: incident["key"] }
    end)

    broadcast! :unassigned_jira_issues, %{items: issues}
end
