class CreateUserComments < ActiveRecord::Migration
  def change
    create_table :user_comments do |t|
    	t.references :user
    	t.boolean :is_published
    	t.text :comment, null: false

      t.timestamps null: false
    end
  end
end
