class EventsController < ApplicationController
  def create
		event = current_user.events.build(params[:event])
		event.created_at = Time.now
		if event.save
			redirect_to events_url
		else
			redirect_to events_url
			flash.notice = "Could not create event"
		end
  end

	def destroy
		event = current_user.events.find(params[:id])
		event.destroy
		redirect_to events_url
		flash.notice = "Your event has been deleted."
	end


  def update
		event = current_user.events.find(params[:id])
		
	  respond_to do |format|
    if event.update_attributes(params[:event])
      format.html { redirect_to events_url, :notice => 'Information was successfully updated.' }
      format.json { head :ok }
    else
      format.html { redirect_to events_url, :notice => 'Event was not saved' }
			end
    end
  end
end
