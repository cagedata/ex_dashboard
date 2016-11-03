use Mix.Config

config :ex_dashboard,
  twitter_search: "#devopsdays",
  victorops_org: System.get_env("VICTOROPS_ORG"),
  victorops_team: System.get_env("VICTOROPS_TEAM"),
  victorops_auth: System.get_env("VICTOROPS_AUTH"),
  jira_url: System.get_env("JIRA_URL"),
  jira_auth: System.get_env("JIRA_AUTH"),
  forecast_api_key: System.get_env("FORECAST_API_KEY"),
  forecast_location: System.get_env("FORECAST_LOCATION")


config :ex_victor_ops,
  api_id: System.get_env("VICTOROPS_ID"),
  api_key: System.get_env("VICTOROPS_KEY")

config :extwitter, :oauth,
  consumer_key: System.get_env("TWITTER_CONSUMER_KEY"),
  consumer_secret: System.get_env("TWITTER_CONSUMER_SECRET"),
  access_token: System.get_env("TWITTER_ACCESS_TOKEN"),
  access_token_secret: System.get_env("TWITTER_ACCESS_SECRET")
