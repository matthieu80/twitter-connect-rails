require 'rails_helper'
require 'services/fake_twitter_client'

RSpec.describe User, type: :model do

	describe "get_followers_from_provider" do

		it "should delete all previous followers and re-create the new ones" do
			stub_const("TwitterClient", FakeTwitterClient)
			user = create :user
			follower = create :follower

			expect(user.followers.count).to eq 1
			expect(user.followers.first.name).to eq follower.name

			user.get_followers_from_provider

			user.reload
			expect(user.followers.count).to eq 1
			expect(user.followers.first.name).to eq "momo"
		end
	end
end 