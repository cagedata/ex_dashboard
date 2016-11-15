use Kitto.Job.DSL

filters = [
  "service_desk_issues": "10300",
  "unassigned_issues": "10100"
]

job :service_desk_issues, every: {2, :minutes} do
  issues = ExDashboard.APIs.Jira.issues(filters[:service_desk_issues])

  short_list = issues["issues"]
    |> Enum.map(&ExDashboard.APIs.Jira.issue_for_dashboard/1)

  broadcast! :service_desk_issues_count, %{value: ExDashboard.APIs.Jira.count(issues)}
  broadcast! :service_desk_issues, %{items: short_list}
end

job :unassigned_jira_issues, every: {2, :minutes} do
  issues = ExDashboard.APIs.Jira.issues(filters[:unassigned_issues])
  issue_list = issues["issues"]
    |> Enum.map(&ExDashboard.APIs.Jira.issue_for_dashboard/1)

    broadcast! :unassigned_jira_issues_count, %{value: ExDashboard.APIs.Jira.count(issues)}
    broadcast! :unassigned_jira_issues, %{items: issue_list}
end
