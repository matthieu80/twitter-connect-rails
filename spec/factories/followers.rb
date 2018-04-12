FactoryGirl.define do
	factory :follower do
		user_id 1
		provider "twitter"
		name "Bernardo"
		avatar "https://myavatar.com/avatar"
	end
end 