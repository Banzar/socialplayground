class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
			params[:zip] = { :zip_code => '2' }
      session[:user_id] = user.id
      redirect_to root_url
			user.update_attributes(params[:zip])
    else
      flash[:notice] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
