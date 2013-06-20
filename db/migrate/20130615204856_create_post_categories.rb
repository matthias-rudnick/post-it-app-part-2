class CreatePostCategories < ActiveRecord::Migration
  def up
  	create_table :post_categories do |t|
  		t.integer :post_id, :category_id
  	end
  end

  def down
  	drop_table
  end
end
