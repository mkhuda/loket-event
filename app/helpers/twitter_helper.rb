module TwitterHelper

  def event_post_to_twitter(event)
    tweet = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = current_user.twitter_token
      config.access_token_secret = current_user.twitter_secret
    end
    event_name = event.name
    event_url = "#{root_url}/events/" + event.id.to_s
    tweet.update("Please see my #{event_name} here: #{event_url}")
  end

end
