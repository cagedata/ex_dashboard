use Kitto.Job.DSL

job :twitter, every: {20, :seconds} do
  search = Application.get_env(:ex_dashboard, :twitter_search)
  tweets = ExTwitter.search(search, count: 1)
          |> Enum.map(fn (tweet) ->
            %{
              text: tweet.text,
              name: tweet.user.name,
              screenName: tweet.user.screen_name,
              profilePic: tweet.user.profile_image_url
            }
          end)

  broadcast!(:twitter, List.first(tweets))
end
