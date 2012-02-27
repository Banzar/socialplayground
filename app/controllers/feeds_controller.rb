class FeedsController < ApplicationController
	before_filter :login_required

	def create
		feed = current_user.feeds.build(params[:feed])
		feed.created_at = Time.now
		feed.save!
		redirect_to root_url
		if current_user.feeds.count > 25
			current_user.feeds.first.destroy
		end
	end

	def destroy
		feed = current_user.feeds.find(params[:id])
		feed.destroy
		redirect_to root_url
		flash.notice = "Your feed has been deleted."
	end
end
