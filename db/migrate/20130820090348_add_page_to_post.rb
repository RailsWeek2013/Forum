class AddPageToPost < ActiveRecord::Migration
  def change
  	add_column :posts , :page , :integer
  end
end
