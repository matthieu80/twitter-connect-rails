class User < ApplicationRecord

	has_many :followers, :dependent => :destroy

	def self.find_or_create_from_auth_hash(auth_hash)
		user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create
		user.update_attributes(
			name: auth_hash.info.name,
			avatar: auth_hash.info.image,
			secret: auth_hash.credentials.secret,
			token: auth_hash.credentials.token
		)
		user
	end

	def get_followers_from_provider
		case provider
		when "twitter"
			provider_followers = TwitterClient.new(self).followers
		end
		followers.delete_all
		add_followers(provider_followers)
	end

	def add_followers provider_followers
		new_list_of_followers = []
		provider_followers.map do |provider_follower|
			new_list_of_followers << {
				user_id: id,
				provider: provider, 
				name: provider_follower.screen_name,
				avatar: provider_follower.profile_image_url_https.to_s
			}
		end
		# bulk insert for accounts with many followers
		Follower.bulk_insert values: new_list_of_followers
	end
end
