class ChatroomChannel < ApplicationCable::Channel
  before_subscribe :set_chatroom

  def subscribed
    reject unless chatroom_present_and_authorized?
    stream_for @chatroom
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    reject unless chatroom_present_and_authorized?

    message_content = data['message']
    user_id = data['user_id']

    if message_content.present? && user_id.present?
      create_and_broadcast_message(message_content, user_id)
    else
      transmit_error("Invalid data. Message and user ID are required.")
    end
  end

  private

  def set_chatroom
    @chatroom = Text::Chatroom.find_by(id: params[:chatroom_id])
  end

  def chatroom_present_and_authorized?
    @chatroom && @chatroom.users.include?(current_user)
  end

  def create_and_broadcast_message(content, user_id)
    message = @chatroom.messages.create(content: content, user_id: user_id)

    if message.persisted?
      ChatroomChannel.broadcast_to(@chatroom, { message: message.content, user_id: message.user.username })
      
      @chatroom.users.each do |user|
        if user.id != current_user.id
          NotificationChannel.broadcast_to(user, { notification: "New message in Chatroom #{@chatroom.id}", chatroom_id: @chatroom.id })
        end
      end
    else
      transmit_error("Message could not be saved. #{message.errors.full_messages.join(', ')}")
    end
  end

  def transmit_error(error_message)
    transmit({ error: error_message })
  end
end
