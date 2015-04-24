class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
    	t.string :service_name, null: false, limit: 50
    	t.text :service_description, null: false

      t.timestamps null: false
    end
  end
end
