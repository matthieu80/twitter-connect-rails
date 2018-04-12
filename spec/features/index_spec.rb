require 'rails_helper'
require 'helpers/spec_logger'
include SpecLogger

RSpec.feature "home" do
  	describe "index" do
  		it "shows the welcome message" do
  			visit root_path
  			expect(page).to have_content('Welcome')
  			expect(page).to have_button('Login via Twitter')
		end
		
		it "shows name of user when logged in" do
			login
			visit root_path
			expect(page).to have_content('Matthieu')
		end
  	end
end