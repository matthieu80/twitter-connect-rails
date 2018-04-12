require 'rails_helper'
require 'helpers/twitter_authentication'
include TwitterAuthentication

RSpec.describe SessionsController, type: :controller do

	describe "create" do

		before do
			valid_credentials
			request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
		end

		it "should successfully create a user" do
			expect {
				post :create, provider: :twitter
			}.to change{ User.count }.by(1)
			expect(request.session[:user_id]).to eq 1
		end
	end

	describe "destroy" do
		let(:user) { create :user }
		
		it "should successfully create a user" do
			request.session[:user_id] = user.id
			expect {
				delete :destroy
			}.to change{request.session[:user_id]}.from(user.id).to(nil)
		end
	end
end 