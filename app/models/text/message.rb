class Text::Message < ApplicationRecord
  self.table_name = "text_messages"

  belongs_to :user
  belongs_to :chatroom, class_name: "Text::Chatroom"

  validates :content, presence: true
end
