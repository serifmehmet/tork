class ChangeUserProposalFormStructure < ActiveRecord::Migration
  def up
  	remove_column :user_proposal_forms, :user_id

  	add_column :user_proposal_forms, :email, :string,  null: false
  	add_column :user_proposal_forms, :first_name, :string, null: false
  	add_column :user_proposal_forms, :last_name, :string, null: false


  end

  def down
		add_column :user_proposal_forms, :user_id, :integer  	
  end
end
