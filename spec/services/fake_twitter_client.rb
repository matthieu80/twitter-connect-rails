class FakeTwitterClient

	def initialize user
		@user = user
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
			config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			config.access_token        = '1234'
			config.access_token_secret = 'secret'
		end
	end

	def get_followers
		collection = []
		ids = get_follower_ids
		return [] if !ids
		for i in 0..ids.count / 100
			section = ids.slice(i*100, (i+1)*100)
			users = lookup(section)
			collection << users unless !users
		end
		collection.flatten
	end

	def get_follower_ids
		begin
			get_follower_ids_from_client
		rescue Twitter::Error::TooManyRequests => e
			nil
		end
	end

	def lookup user_ids
		begin
			get_users_from_client
		rescue Twitter::Error::TooManyRequests => e
			nil
		end
	end

	def get_follower_ids_from_client
		['1']
	end

	def get_users_from_client
		[Twitter::User.new(id: '123456', screen_name: 'momo', profile_image_url_https: 'thatsmyavatar.com/avatar.png')]
	end
end