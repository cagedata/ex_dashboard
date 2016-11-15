use Kitto.Job.DSL

job :victorops_incidents, every: {2, :minutes} do
  phases = ["UNACKED", "ACKED"]
  broadcast! :victorops_incidents, %{items: ExDashboard.APIs.VictorOps.incidents(phases)}
end

job :victorops_oncall, every: {30, :minutes} do
  team = Application.get_env :ex_dashboard, :victorops_team
  broadcast! :victorops_oncall, %{text: ExDashboard.APIs.VictorOps.on_call(team)}
end
