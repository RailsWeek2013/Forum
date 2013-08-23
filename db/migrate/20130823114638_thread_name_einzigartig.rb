class ThreadNameEinzigartig < ActiveRecord::Migration
  def change
    add_index :user_threads, :title, unique: true
  end
end
