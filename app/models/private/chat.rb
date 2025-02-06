class Private::Chat < ApplicationRecord
  self.table_name = "private_chats"
  
  has_many :messages, class_name: "Private::Message", foreign_key: :chat_id
  belongs_to :sender, foreign_key: :sender_id, class_name: "User"
  belongs_to :recipient, foreign_key: :recipient_id, class_name: "User"
end
