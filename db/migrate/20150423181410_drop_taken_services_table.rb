class DropTakenServicesTable < ActiveRecord::Migration
  def change
  	drop_table :user_taken_services
  end
end
