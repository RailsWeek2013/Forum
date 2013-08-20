class RemovePageFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts , :page 
  end
end
