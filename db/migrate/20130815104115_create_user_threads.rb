class CreateUserThreads < ActiveRecord::Migration
  def change
    create_table :user_threads do |t|
      t.string :title
      t.references :topic

      t.timestamps
    end
  end
end
