class AddKeywordColumns < ActiveRecord::Migration
  def change
  	add_column :brands, :meta_keywords, :string, :limit => 100
  	add_column :brand_makes, :meta_keywords, :string, :limit => 100
  	add_column :make_engine_types, :meta_keywords, :string, :limit => 100

  end
end
