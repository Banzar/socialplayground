class ItemsController < ApplicationController
  def create
		item = current_user.items.create(params[:item])
		if item.save
			redirect_to my_items_url, :notice => "Your item has been added."
		else
			redirect_to my_items_url
		end
  end

	def destroy
		item = current_user.items.find(params[:id])
		item.destroy
		redirect_to my_items_url
		flash.notice = "Your item has been removed."
	end


  def update
		item = current_user.items.find(params[:id])
		
	  respond_to do |format|
    if item.update_attributes(params[:item])
      format.html { redirect_to my_items_url, :notice => 'Item was successfully updated.' }
      format.json { head :ok }
    else
      format.html { redirect_to my_items_url, :notice => 'Item was not saved' }
			end
    end
  end
end
