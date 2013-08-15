class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.boolean :spam
      t.references :userThread, index: true
      t.integer :rating

      t.timestamps
    end
  end
end
