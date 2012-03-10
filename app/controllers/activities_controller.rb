class ActivitiesController < ApplicationController
  def new

  end

  def create
		activity = Activity.create(params[:activity])
		activity.save
		redirect_to family_fun_url
  end

  def destroy
  end

	def index
		@activities = Activity.all
	end

	def show
		@activity = Activity.find(params[:id])
	end
end
