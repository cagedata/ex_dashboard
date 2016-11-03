defmodule VictorOps do
  def incidents(phases) do
    {:ok, incidents} = ExVictorOps.Incidents.get
    incidents
      |> Enum.filter(fn(incident) -> Enum.member? phases, incident.currentPhase end)
      |> Enum.map(fn(incident) ->
        label = if String.length(incident.entityDisplayName) > 0 do
          incident.entityDisplayName
        else
          incident.entityId
        end
      %{
        label: String.replace(label, "&gt;", ">"),
        phase: incident.currentPhase
      }
    end)
  end

  def on_call(team) do
    {:ok, team} = ExVictorOps.OnCall.get_team "support-team", days_forward: 0
    on_call = List.first(team.schedule)["onCall"]
    if !Enum.empty?(team.overrides) do
      Enum.each team.overrides, fn(override, acc) ->
        if override["origOnCall"] == on_call, do: on_call = override["overrideOnCall"]
      end
    end
    name_for_user on_call
  end

  defp name_for_user(user) do
    org = Application.get_env(:ex_dashboard, :victorops_org)
    url = "https://portal.victorops.com/api/v1/org/#{org}/users/#{user}"
    headers = ["Authorization": "Basic #{Application.get_env(:ex_dashboard, :victorops_auth)}"]
    user = HTTPoison.get!(url, headers).body
    |> Poison.decode!

    user["firstName"] <> " " <> user["lastName"]
  end
end
