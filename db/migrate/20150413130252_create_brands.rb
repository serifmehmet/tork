class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.string :brand_name, null: false
    	t.text :brand_description

      t.timestamps null: false
    end

    add_index :brands, :brand_name
  end

end
