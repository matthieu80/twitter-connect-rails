require 'helpers/twitter_authentication'
include TwitterAuthentication

module SpecLogger
	
	def login
		valid_credentials
		
		visit root_path
		expect(page).to have_button('Login via Twitter')
		click_button('Login via Twitter')
	end
end 