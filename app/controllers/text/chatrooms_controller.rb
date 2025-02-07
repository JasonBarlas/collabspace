class Text::ChatroomsController < ApplicationController
  before_action :ensure_membership, only: [:show]

  def show
    @chatroom = Text::Chatroom.find(params[:id])
  end

  def create_message
    @chatroom = Text::Chatroom.find(params[:chatroom_id])
    message = @chatroom.messages.create!(permitted_params)
    
    ActionCable.server.broadcast("chatroom_#{@chatroom.id}", message: message.content, user_id: message.user_id)
    
    redirect_to chatroom_path(@chatroom)
  end

  private

  def permitted_params
    params.require(:message).permit(:content, :user_id)
  end

  def ensure_membership
    chatroom = Text::Chatroom.find(params[:id])
    unless chatroom.users.include?(current_user)
      flash[:alert] = "You are not authorized to access this chatroom."
      redirect_to root_path
    end
  end
end
