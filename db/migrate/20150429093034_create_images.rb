class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.integer :f_id
    	t.string :caption, :limit => 100
    	t.integer :image_type, null: false
    	t.integer :position
    	t.string :image

      t.timestamps null: false
    end
  end
end
