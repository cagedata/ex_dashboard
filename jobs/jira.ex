use Kitto.Job.DSL

job :open_jira_issues, every: {2, :minutes} do
  count = Jira.incidents(:service_desk_issues)
  |> Jira.count

  broadcast! :service_desk_issue_count, %{value: count}
end

job :unassigned_jira_issues, every: {2, :minutes} do
  issues = Jira.incidents(:unassigned_issues)["issues"]
    |> Enum.map(fn(incident) ->
      %{ label: incident["fields"]["summary"], value: incident["key"] }
    end)

    broadcast! :unassigned_jira_issues, %{items: issues}
end
