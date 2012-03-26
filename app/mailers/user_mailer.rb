class UserMailer < ActionMailer::Base
	default :from => ENV['GMAIL_SMTP_USER']
	def registration_confirmation(user)
		@user = user
		mail(:to => user.email, :subject => "Thanks for joining!")
	end
end
