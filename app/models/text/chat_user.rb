class Text::ChatUser < ApplicationRecord
  self.table_name = "text_chat_users"

  belongs_to :user
  belongs_to :chatroom, class_name: "Text::Chatroom"

  validates :user_id, presence: true
  validates :chatroom_id, presence: true
  validates :user_id, uniqueness: { scope: :chatroom_id }
end
