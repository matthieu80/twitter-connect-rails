require 'rails_helper'
require 'helpers/twitter_authentication'
include TwitterAuthentication
 
RSpec.feature "login" do
   	describe "successful" do
 
   		before do
   			valid_credentials
       	end
 
       	it "shows the Twitter screen name of the user" do
         	visit root_path
   			expect(page).to have_button('Login via Twitter')
   			click_button('Login via Twitter')
   			expect(page).to have_content('You logged in successfully')
   		end
   	end
 
    describe "unsuccessful" do
 
   		before do
   			invalid_credentials
       	end
 
       	it "redirected to root with flash message" do
   			visit root_path
   			expect(page).to have_button('Login via Twitter')
   			click_button('Login via Twitter')
   			expect(page).to have_content('Oops. There was a problem while logging in...')
   		end
   	end
end