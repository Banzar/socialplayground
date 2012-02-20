class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user

private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

	def logged_in?
		current_user
	end

	def login_required
		unless logged_in?
			flash[:error] = "You must be signed in before accessing this page"
			redirect_to log_in_url
		end
	end	
end 

	
