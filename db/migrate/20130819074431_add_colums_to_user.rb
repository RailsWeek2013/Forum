class AddColumsToUser < ActiveRecord::Migration
  def change
  	add_column :users, :lastname, :string, default: "", null: false
  	add_column :users, :name, :string, default: "", null: false
  	add_column :users, :birthday, :datetime
  	add_column :users, :gender, :string
  	add_column :users, :signature, :string
  end
end
