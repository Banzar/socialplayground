class UserMailer < ActionMailer::Base
	default :from => "slaitors@gmail.com"
	def registration_confirmation(user)
		@user = user
		mail(:to => user.email, :subject => "Thanks for joining!")
	end
end
