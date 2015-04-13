class CreateUserTakenServices < ActiveRecord::Migration
  def change
    create_table :user_taken_services do |t|
    	t.references :user
    	t.string :report_no, limit: 10, null: false
    	t.text :vehicle_info
    	t.float :cost
    	t.text :situation
    	t.text :comment

      t.timestamps null: false
    end

    add_index :user_taken_services, :report_no
  end
end
