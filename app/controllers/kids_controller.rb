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

	def update
		kid = current_user.kids.find(params[:id])
		
	  respond_to do |format|
    if kid.update_attributes(params[:kid])
      format.html { redirect_to root_url, :notice => 'Child was successfully updated.' }
      format.json { head :ok }
    else
      format.html { render_to my_kid_url, :notice => 'Child was not updated' }
			end
    end
	end

	def my_kid
		@child = Kid.find(params[:id])
	end
end
