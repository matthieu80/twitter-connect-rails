class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	helper_method :current_user

	def authenticate_user
		current_user
		if @current_user
			return true
		else
			return false
		end
	end

	protected

	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
end
