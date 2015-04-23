class AddFieldsToProposalForms < ActiveRecord::Migration
  def change
  	add_column :user_proposal_forms, :brand_id, :integer, references: :brands
  	add_column :user_proposal_forms, :brand_make_id, :integer, references: :brand_makes
  	add_column :user_proposal_forms, :phone_number, :string, :null => false, limit: 20
  	add_column :user_proposal_forms, :care_operation, :text, limit: 450
  end
end
