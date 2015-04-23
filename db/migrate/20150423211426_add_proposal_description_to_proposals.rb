class AddProposalDescriptionToProposals < ActiveRecord::Migration
  def change
  	add_column :user_proposal_forms, :proposal_description, :text
  end
end
