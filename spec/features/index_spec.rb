require 'rails_helper'

RSpec.feature "home" do
  	describe "index" do
  		it "shows the welcome message" do
  			visit root_path
  			expect(page).to have_content('Welcome')
  		end
  	end
end