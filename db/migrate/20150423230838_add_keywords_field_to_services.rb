class AddKeywordsFieldToServices < ActiveRecord::Migration
  def change
  	add_column :services, :meta_keywords, :string, :limit => 100
  end
end
