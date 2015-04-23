class Brand < ActiveRecord::Base
	has_many :brand_makes, dependent: :destroy
	has_many :user_appointments
	has_many :user_proposal_forms

	scope :sorted, lambda {order("brands.brand_name ASC")}
end
