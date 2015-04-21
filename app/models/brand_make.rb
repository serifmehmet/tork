class BrandMake < ActiveRecord::Base
	belongs_to :brand
	has_many :make_engine_types, dependent: :destroy

	scope :sorted, lambda {order("brand_makes.make_name ASC")}
end
