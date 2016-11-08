defmodule ExDashboard.APIs.Reddit do
  def subreddit(sub) do
    HTTPoison.get!("https://www.reddit.com/r/#{sub}.json").body
      |> Poison.decode!
  end

  def only_images(feed) do
    feed["data"]["children"]
      |> Enum.filter_map(fn(post) ->
        String.ends_with? post["data"]["url"], ["png", "gif", "jpg", "jpeg"]
      end, &(&1["data"]["url"]))
  end
end
