class KidsController < ApplicationController
  def index
  end

  def new
		@kids = current_user.kids
  end

  def create
		kid = current_user.kids.create(params[:kid])
		if kid.save
			redirect_to my_kids_url, :notice => "Your child has been added."
		else
			render 'new', :notice => "Unable to save this child"
		end
  end

  def destroy
		kid = Kid.find(params[:id])
		kid.destroy
		redirect_to my_kids_url
  end

	def my_kid
		@child = Kid.find(params[:id])
	end
end
