module Dashboard
  class DashboardPostsService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      { 
        posts: PostFilters::PostFiltersService.new(Post.all, @params).call 
      }
    end
  end

  private_constant :DashboardPostsService
end
