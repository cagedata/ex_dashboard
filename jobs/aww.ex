use Kitto.Job.DSL

job :aww, every: {1, :minutes} do
  image = Reddit.subreddit(:aww)
    |> Reddit.only_images
    |> Enum.random
  broadcast! :aww, %{image: image}
end
