class Service < ActiveRecord::Base
	has_many :images, as: :imageable, :dependent => :destroy
	has_many :images_title,-> {where "image_type = 2"}, as: :imageable, class_name: "Image", :dependent => :destroy
	has_many :images_icon,-> {where "image_type = 1"}, as: :imageable, class_name: "Image", :dependent => :destroy
	has_many :images_regular,-> {where "image_type = 3"}, as: :imageable, class_name: "Image", :dependent => :destroy

	accepts_nested_attributes_for :images

	
end
