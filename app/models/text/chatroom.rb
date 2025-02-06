class Text::Chatroom < ApplicationRecord
  self.table_name = "text_chatrooms"

  has_many :chat_users, dependent: :destroy, class_name: "Text::ChatUser"
  has_many :users, through: :chat_users
  has_many :messages, dependent: :destroy, class_name: "Text::Message"

  validates :users, presence: true
end
