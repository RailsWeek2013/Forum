class AddDefaultValues < ActiveRecord::Migration
  def change
  	change_column :posts, :spam, :boolean, null: false, default: false
  	change_column :posts, :rating, :integer, null: false, default: 0
  	change_column :posts, :user_thread_id, :integer, null: false
  	change_column :posts, :user_id, :integer, null: false
  	change_column :posts, :title, :string, null: false
  	change_column :posts, :content, :text, null: false

  	change_column :user_threads, :topic_id, :integer, null: false
  	change_column :user_threads, :user_id, :integer, null: false
  	change_column :user_threads, :title, :string, null: false

  	change_column :topics, :name, :string, null: false

    add_index :topics, :name, unique: true
  end
end
