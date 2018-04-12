require 'rails_helper'
require 'helpers/twitter_authentication'
include TwitterAuthentication
require 'services/fake_twitter_client'
 
RSpec.feature "login" do
   	describe "successful" do
 
   		before do
        stub_const("TwitterClient", FakeTwitterClient)
   			valid_credentials
      end
 
      it "shows the Twitter screen name of the user" do
        visit root_path
   			expect(page).to have_link('Login via Twitter')
   			click_link('Login via Twitter')
   			expect(page).to have_content('You logged in successfully')
   		end
   	end
 
    describe "unsuccessful" do
 
   		before do
   			invalid_credentials
      end
 
      it "redirected to root with flash message" do
   			visit root_path
   			expect(page).to have_link('Login via Twitter')
   			click_link('Login via Twitter')
   			expect(page).to have_content('Oops. There was a problem while logging in...')
   		end
   	end
end