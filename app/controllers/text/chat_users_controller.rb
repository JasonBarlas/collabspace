class Text::ChatUsersController < ApplicationController
  def create
    if permitted_params[:chatroom_id].blank?
      chatroom = Text::Chatroom.create
      if chatroom.persisted?
        @chatroom_id = chatroom.id
      else
        flash[:alert] = "Unable to create Chatroom. Please try again."
        redirect_to pages_path(content_option: "chats") and return
      end
    end      

    @chat_user = Text::ChatUser.new(chat_user_params)
    if @chat_user.save
      flash[:notice] = "Friend added to the chatroom!"
      redirect_to pages_path(content_option: "chats")
    else
      flash[:alert] = "Unable to add friend to the chatroom. Please try again."
      redirect_to pages_path(content_option: "chats")
    end
  end

  private

  def permitted_params
    params.require(:text_chat_user).permit(:user_id, :chatroom_id)
  end

  def chat_user_params
    { 
      user_id: permitted_params[:user_id], 
      chatroom_id: @chatroom_id || permitted_params[:chatroom_id]
    }
  end
end
