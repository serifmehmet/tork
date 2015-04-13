class CreateUserProposalForms < ActiveRecord::Migration
  def change
    create_table :user_proposal_forms do |t|
    	t.references :user
    	t.string :form_no
    	t.string :vehicle_info
    	t.string :vehicle_situation

      t.timestamps null: false
    end

    add_index :user_proposal_forms, :form_no
  end
end
