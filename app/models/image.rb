class Image < ActiveRecord::Base
	belongs_to :imageable, polymorphic: true

	mount_uploader :image, ImageUploader

	enum image_type: {icon: 1, title: 2, regular: 3, slider: 4}

	scope :get_icon, lambda {where("images.image_type = 1")}
	scope :get_title, lambda {where("images.image_type = 2")}
	scope :get_regular, lambda {where("images.image_type = 3")}
	scope :get_slider, lambda {where("images.image_type = 4")}
end
