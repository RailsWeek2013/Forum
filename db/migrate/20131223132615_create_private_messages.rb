class CreatePrivateMessages < ActiveRecord::Migration
  def change
    create_table :private_messages do |t|
      t.text :content
      t.string :title
      t.integer :sender_id
      t.integer :receiver_id
      t.boolean :readed

      t.timestamps
    end
  end
end
