module Dashboard
  class DashboardFriendsService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      { 
        new_friendship: Friendship.new, 
        friends: @user.all_friends, 
        non_friends: @user.all_non_friends 
      }
    end
  end
    
  private_constant :DashboardFriendsService
end
