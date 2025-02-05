module Dashboard
  class DashboardService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      { 
        new_post:       new_service[:new_post], 
        categories:     new_service[:categories], 
        posts:          posts_service[:posts], 
        new_friendship: friends_service[:new_friendship], 
        friends:        friends_service[:friends], 
        non_friends:    friends_service[:non_friends] 
      }
    end

    private

    def new_service
      @new_service ||= DashboardNewService.new(@user, @params).call
    end

    def posts_service
      @posts_service ||= DashboardPostsService.new(@user, @params).call
    end

    def friends_service
      @friends_service ||= DashboardFriendsService.new(@user, @params).call
    end
  end
end
