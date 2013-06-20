class CreateCommentsAgain < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.text :comment_text
  		t.integer :user_id, :post_id
  	end
  end

  def down
  	drop_table :comments
  end
end
