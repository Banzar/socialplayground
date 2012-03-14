class SentController < ApplicationController
	before_filter :login_required

	def index
		@messages = current_user.sent_messages.paginate(:per_page => 10, :page => params[:page], :order => "created_at DESC")
	end

	def show
		@message = current_user.sent_messages.find(params[:id])
	end

  def new
    @users = []
    unless params[:to] == nil
      @users << User.find(params[:to])
    else
      @users = current_user.friends.all
    end
    @message = current_user.sent_messages.build(:to => params[:to])
  end

	def create
		@message = current_user.sent_messages.build(params[:message])
		if @message.save
			flash[:notice] = "Message sent."
			redirect_to :action => "index"
		else
			render :action => "new"
		end
	end

	def destroy
		@message = current_user.sent_messages.find(params[:id])
		@message.destroy

		redirect_to sent_mail_path
	end
end
