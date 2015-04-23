class AddCareOperationToAppointments < ActiveRecord::Migration
  def change
  	add_column :user_appointments, :care_operation, :text, :limit => 450, null: false
  end
end
