class CreateTextMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :text_messages do |t|
      t.text :content, null: false
      t.references :user, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: { to_table: :text_chatrooms }

      t.timestamps
    end

    add_index :text_messages, [:user_id, :chatroom_id]
  end
end
