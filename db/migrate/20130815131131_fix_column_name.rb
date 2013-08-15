class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :posts, :userThread_id, :user_thread_id
  end
end
