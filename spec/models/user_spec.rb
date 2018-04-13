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


	describe "Twitter client reach limit when fetching 'followers/ids'" do

		before do
			stub_const("TwitterClient", FakeTwitterClient)
			allow_any_instance_of(FakeTwitterClient).to receive(:get_follower_ids_from_client).and_raise(Twitter::Error::TooManyRequests)
		end

		it 'should get rescued' do
			user = create :user
			user.get_followers_from_provider
		end

		it 'should not get previous followers deleted' do
			
			user = create :user
			follower = create :follower

			expect(user.followers.count).to eq 1
			expect(user.followers.first.name).to eq follower.name

			user.get_followers_from_provider

			user.reload
			expect(user.followers.count).to eq 1
			expect(user.followers.first.name).to eq follower.name
		end

	end

	describe "Twitter client reach limit when fetching '/lookup'" do

		before do
			stub_const("TwitterClient", FakeTwitterClient)
			allow_any_instance_of(FakeTwitterClient).to receive(:get_users_from_client).and_raise(Twitter::Error::TooManyRequests)
		end

		it 'should get rescued' do
			user = create :user
			user.get_followers_from_provider
		end

		it 'should not get previous followers deleted' do
			
			user = create :user
			follower = create :follower

			expect(user.followers.count).to eq 1
			expect(user.followers.first.name).to eq follower.name

			user.get_followers_from_provider

			user.reload
			expect(user.followers.count).to eq 1
			expect(user.followers.first.name).to eq follower.name
		end
	end
end