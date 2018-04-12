class SessionsController < ApplicationController
	def create
		redirect_to root_path, notice: "You logged in successfully"
	end

	def fail
		redirect_to root_path, alert: "Oops. There was a problem while logging in..."
	end
end
