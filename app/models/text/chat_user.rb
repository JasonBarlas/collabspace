class Text::ChatUser < ApplicationRecord
  self.table_name = "text_chat_users"

  belongs_to :user
  belongs_to :chatroom, class_name: "Text::Chatroom"

  validates :user_id, presence: true
  validates :chatroom_id, presence: true
  validates :user_id, uniqueness: { scope: :chatroom_id }

  scope :for_user, ->(user_id) { where(user_id: user_id) }

  before_destroy :check_and_delete_chatroom_if_last_user

  private

  def check_and_delete_chatroom_if_last_user
    if chatroom.chat_users.count == 1
      chatroom.destroy
    end
  end
end
