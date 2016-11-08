use Kitto.Job.DSL

job :open_jira_issues, every: {2, :minutes} do
  count = ExDashboard.APIs.Jira.incidents(:service_desk_issues)
  |> ExDashboard.APIs.Jira.count

  broadcast! :service_desk_issue_count, %{value: count}
end

job :unassigned_jira_issues, every: {2, :minutes} do
  issues = ExDashboard.APIs.Jira.incidents(:unassigned_issues)["issues"]
    |> Enum.map(fn(incident) ->
      %{ label: incident["fields"]["summary"], value: incident["key"] }
    end)

    broadcast! :unassigned_jira_issues, %{items: issues}
end
