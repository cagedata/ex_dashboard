use Kitto.Job.DSL

job :open_jira_issues, every: {2, :minutes} do
  count = Jira.incidents(:service_desk_issues)
  |> Jira.count

  broadcast! :service_desk_issue_count, %{value: count}
end
