class Brand < ActiveRecord::Base
	has_many :brand_makes, dependent: :destroy

	scope :sorted, lambda {order("brands.brand_name ASC")}
end
