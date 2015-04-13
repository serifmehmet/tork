class CreateMakeEngineTypes < ActiveRecord::Migration
  def change
    create_table :make_engine_types do |t|
    	t.references :brand_make
    	t.string :make_type_name
    	
      t.timestamps null: false
    end
  end
end
