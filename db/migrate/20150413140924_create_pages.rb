class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
    	t.string :page_name
    	t.string :page_keywords
    	t.string :page_title
    	t.string :page_description
    	t.string :page_url
    	t.text	:page_content

      t.timestamps null: false
    end

    add_index :pages, :page_name
  end
end
