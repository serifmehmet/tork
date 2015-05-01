class ChangeImageTableStructure < ActiveRecord::Migration
  def change
  	remove_column :images, :f_id
  	add_column :images, :imageable_id, :integer
  	add_column :images, :imageable_type, :string
  end
end
