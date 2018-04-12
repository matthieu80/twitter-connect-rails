class SessionsController < ApplicationController
	def create
		user = User.find_or_create_from_auth_hash(auth_hash)
		session[:user_id] = user.id
		user.get_followers_from_provider
		redirect_to root_path, flash: { notice: "You logged in successfully"}
	end

	def fail
		redirect_to root_path, flash: { alert: "Oops. There was a problem while logging in..."}
	end

	def destroy
		reset_session
		redirect_to root_path, flash: { notice: "Logged out"}
	end

	protected

	def auth_hash
		request.env['omniauth.auth']
	end
end
