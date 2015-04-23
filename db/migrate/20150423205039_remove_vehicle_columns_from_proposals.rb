class RemoveVehicleColumnsFromProposals < ActiveRecord::Migration
  def change
  	remove_column :user_proposal_forms, :vehicle_info
  	remove_column :user_proposal_forms, :vehicle_situation
  end
end
