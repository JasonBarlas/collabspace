class Private::Message < ApplicationRecord
  self.table_name = "private_messages"

  belongs_to :user
  belongs_to :chat, class_name: 'Private::Chat', foreign_key: :chat_id
end
