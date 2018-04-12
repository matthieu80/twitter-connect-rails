class User < ApplicationRecord

	has_many :followers

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
end
