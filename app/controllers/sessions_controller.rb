class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
			params[:zip] = { :zip_code => "2" }
			user.update_attributes(params[:zip])
      session[:user_id] = user.id
      redirect_to root_url
    else
      flash[:notice] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
		user = current_user
    session[:user_id] = nil
    redirect_to root_url
  end
end
