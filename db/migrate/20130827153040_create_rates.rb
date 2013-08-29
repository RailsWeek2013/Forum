class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.integer :post_id, null: false
      t.integer :user_id, null: false
      t.string  :type, null: false

      t.timestamps
    end

    remove_column :posts, :rating

    add_index :rates, [:user_id, :post_id], :unique => true
  end
end
