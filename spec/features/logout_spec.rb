require 'rails_helper'
require 'helpers/spec_logger'
include SpecLogger

RSpec.feature "login" do
	describe "successful" do
		it "shows the Twitter screen name of the user" do
			login
			expect(page).to have_content('Matthieu')
			expect(page).to have_button('Logout')
			click_button('Logout')
			expect(page).to have_content('Logged out')
		end
	end
end