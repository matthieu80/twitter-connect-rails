class FakeTwitterClient

	def initialize user
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
			config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			config.access_token        = '1234'
			config.access_token_secret = 'secret'
		end
	end

	def get_followers
		[Twitter::User.new(id: '123456', screen_name: 'momo', profile_image_url_https: 'thatsmyavatar.com/avatar.png')]
	end
end 