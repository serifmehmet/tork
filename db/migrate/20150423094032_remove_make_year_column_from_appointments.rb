class RemoveMakeYearColumnFromAppointments < ActiveRecord::Migration
  def change
  	remove_column :user_appointments, :make_year
  end
end
