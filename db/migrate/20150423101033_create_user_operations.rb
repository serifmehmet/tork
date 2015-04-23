class CreateUserOperations < ActiveRecord::Migration
  def change
    create_table :user_operations do |t|
    	t.references :user
    	t.references :user_proposal_form
    	t.text :op_status
    	t.boolean :op_is_closed
    	
      t.timestamps null: false
    end
  end
end
