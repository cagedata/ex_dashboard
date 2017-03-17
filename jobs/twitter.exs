use Kitto.Job.DSL

defmodule Twitter do
  def tweet_to_widget(tweet) do
    %{
      text: tweet.text,
      name: tweet.user.name,
      screenName: tweet.user.screen_name,
      profilePic: tweet.user.profile_image_url
    }
  end
end

job :twitter, every: {1, :minute} do
  search = Application.get_env(:ex_dashboard, :twitter_search)
  tweets = ExTwitter.search(search, count: 1)
          |> Enum.map(&(Twitter.tweet_to_widget(&1)))

  broadcast!(:twitter, List.first(tweets))
end
