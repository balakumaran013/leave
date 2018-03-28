class UserMailer < ApplicationMailer
	default from:'abalatestcode@gmail.com'

	def apply_leave_email(user,leavelog)
		@user = user
		@leavelog = leavelog
		mail(to:"abalatestcode@gmail.com",subject:'Employee requested for leave')
	end

	def leave_accept(user,leavelog_approve)
		@user = user
		@leavelog_approve = leavelog_approve
		mail(to:@user.email,cc:"abalatestcode@gmail.com",subject:"Leave accepted")	
	end

	def leave_reject(user,leavelog_reject)
		@user = user
		@leavelog_reject = leavelog_reject
		mail(to:@user.email,cc:"abalatestcode@gmail.com",subject:"Leave rejected")
	end
end
