class UserAppointment < ActiveRecord::Base

	scope :sorted, lambda {order("user_appointments.created_at ASC")}

	def full_name
		first_name + ' ' + last_name
	end
end
