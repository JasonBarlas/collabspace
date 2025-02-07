module Dashboard
  class DashboardChatsService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      { 
        new_chat_user: Text::ChatUser.new, 
        chatrooms: Text::ChatUser.for_user(@user.id).includes(:chatroom).map(&:chatroom) 
      }
    end
  end

  private_constant :DashboardNewService
end
