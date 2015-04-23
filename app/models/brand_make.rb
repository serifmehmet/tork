class BrandMake < ActiveRecord::Base
	belongs_to :brand
	has_many :make_engine_types, dependent: :destroy
	has_many :user_appointments
	has_many :user_propsal_forms

	scope :sorted, lambda {order("brand_makes.make_name ASC")}
end
