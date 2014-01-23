require 'twitter'
class Lifelog
  class Twitter
    def client
      @client ||= ::Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV['twitter_consumer_key']
        config.consumer_secret     = ENV['twitter_consumer_sec']
        config.oauth_token         = ENV['twitter_access_token']
        config.oauth_token_secret  = ENV['twitter_access_secret']
      end
    end

    def today
      one_day_ago = (DateTime.now - 1).to_time
      client.user_timeline('gong023', { count: 200 }).map do |t|
        t.text if t.created_at > one_day_ago
      end.compact
    end
  end
end