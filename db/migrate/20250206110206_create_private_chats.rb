class CreatePrivateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :private_chats do |t|
      t.integer :recipient_id
      t.integer :sender_id
      t.timestamps
    end

    add_index :private_chats, :recipient_id
    add_index :private_chats, :sender_id
    add_index :private_chats, [:recipient_id, :sender_id], unique: true
  end
end
