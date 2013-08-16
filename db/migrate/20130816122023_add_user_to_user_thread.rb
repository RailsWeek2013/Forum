class AddUserToUserThread < ActiveRecord::Migration
  def change
  	add_column :user_threads , :user_id , :integer 
  end
end
