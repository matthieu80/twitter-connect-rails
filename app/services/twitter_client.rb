class TwitterClient

	def initialize user
		@user = user
		@client = Twitter::REST::Client.new do |config|
			config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
			config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
			config.access_token        = user.token
			config.access_token_secret = user.secret
		end
	end

	def get_followers
		if @user.id == 1
			collection = []
			ids = get_follower_ids
			return [] if !ids
			for i in 0..ids.count / 100
				section = ids.slice(i*100, (i+1)*100)
				users = lookup(section)
				collection << users unless !users
			end
			collection.flatten
		else
			@client.followers.take(200)
		end
	end

	def get_follower_ids
		begin
			@client.follower_ids("Marsh931").to_a
		rescue Twitter::Error::TooManyRequests => e
			nil
		end
	end

	def lookup user_ids
		begin
			@client.users(user_ids)
		rescue Twitter::Error::TooManyRequests => e
			nil
		end
	end
end