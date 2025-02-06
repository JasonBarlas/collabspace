class CreateTextChatrooms < ActiveRecord::Migration[8.0]
  def change
    create_table :text_chatrooms do |t|
      t.timestamps
    end
  end
end
