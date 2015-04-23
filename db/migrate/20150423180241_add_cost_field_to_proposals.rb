class AddCostFieldToProposals < ActiveRecord::Migration
  def change
  	add_column :user_proposal_forms, :given_cost, :string, limit: 20
  	add_column :user_proposal_forms, :is_accepted, :boolean
  	
  end
end
