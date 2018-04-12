class TwitterClient

	def initialize user
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
			config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			config.access_token        = user.token
			config.access_token_secret = user.secret
		end
	end

	def followers
		@client.followers
	end
end 