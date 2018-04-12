module TwitterAuthentication
 	def valid_credentials
 		omniauth_hash = { :provider => 'twitter',
 		                :uid => '12345',
 		                :info => {
 		                    :name => 'Matthieu',
 		                    :email => 'matt@myemail.com',
 		                    :nickname => 'Matthieu',
 		                    :image => "http://mattavatar.com/myavatar.png"
 		                },
 		                :credentials => {
 		                  :secret => '12345678',
 		                  :token => 'jifwuh78wfh8h32'
 		                }
 		}
 		OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new(omniauth_hash)
 	end
 
 	def invalid_credentials
 		OmniAuth.config.mock_auth[:twitter] = :invalid_credentials
 	end
end 