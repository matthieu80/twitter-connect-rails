require 'rails_helper'
require 'helpers/spec_logger'
include SpecLogger
require 'services/fake_twitter_client'

RSpec.feature "home" do
  	describe "index without login" do
  		it "shows the welcome message" do
  			visit root_path
  			expect(page).to have_content('Welcome')
  			expect(page).to have_button('Login via Twitter')
		end
	end

	describe "index with login" do
		before do
			stub_const("TwitterClient", FakeTwitterClient)
			login
		end
		
		it "shows name of user when logged in" do
			visit root_path
			expect(page).to have_content('Matthieu')
		end

		it "displays the followers" do
			visit root_path
			expect(page).to have_content('momo')
			expect(page).to have_css("img[src*='thatsmyavatar.com/avatar.png']")
		end
  	end


end