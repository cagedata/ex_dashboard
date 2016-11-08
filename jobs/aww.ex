use Kitto.Job.DSL

job :aww, every: {1, :minutes} do
  image = ExDashboard.APIs.Reddit.subreddit(:aww)
    |> ExDashboard.APIs.Reddit.only_images
    |> Enum.random
  broadcast! :aww, %{image: image}
end
