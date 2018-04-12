require 'rails_helper'
require 'helpers/spec_logger'
include SpecLogger

RSpec.feature "login" do
	describe "successful" do

		before do
			stub_const("TwitterClient", FakeTwitterClient)
			login
		end
		
		it "shows the Twitter screen name of the user" do
			expect(page).to have_content('Matthieu')
			expect(page).to have_button('Logout')
			click_button('Logout')
			expect(page).to have_content('Logged out')
		end
	end
end