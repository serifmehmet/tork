class CreateBrandMakes < ActiveRecord::Migration
  def change
    create_table :brand_makes do |t|
    	t.references :brand
    	t.string :make_name, null: false
    	t.text :make_description

      t.timestamps null: false
    end

    add_index :brand_makes, :make_name
  end
end
