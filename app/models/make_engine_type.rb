class MakeEngineType < ActiveRecord::Base
	belongs_to :brand_make

	scope :sorted, lambda {order("make_engine_types.make_type_name ASC")}
end
