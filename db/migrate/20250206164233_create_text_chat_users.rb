class CreateTextChatUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :text_chat_users do |t|
      t.references :chatroom, null: false, foreign_key: { to_table: :text_chatrooms }
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

    add_index :text_chat_users, [:chatroom_id, :user_id], unique: true
  end
end
