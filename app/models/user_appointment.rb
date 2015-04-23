class UserAppointment < ActiveRecord::Base

	belongs_to :brand
	belongs_to :brand_make
	
	scope :sorted, lambda {order("user_appointments.created_at ASC")}

	def full_name
		first_name + ' ' + last_name
	end
end
