class MessagesController < ApplicationController
  def show
    @message = current_user.received_messages.find(params[:id])
		@message.update_attribute("viewed", true)
  end
  
  def destroy
    @message = current_user.received_messages.find(params[:id]) || current_user.sent_messages.find(params[:id])
    @message.destroy
    redirect_to mymail_path
  end

  def reply
    @original = current_user.received_messages.find(params[:id])
    
    subject = @original.subject.sub(/^(Re: )?/, "Re: ")
    body = @original.body.gsub(/^/, "> ")
    @message = current_user.sent_messages.build(:to => [@original.author.id], :subject => subject, :body => "\n\n\n" + body)
    render :template => "sent/new"
  end
end
