require 'helpers/twitter_authentication'
include TwitterAuthentication

module SpecLogger
	
	def login
		valid_credentials
		
		visit root_path
		expect(page).to have_link('Login via Twitter')
		click_link('Login via Twitter')
	end
end 