module Dashboard
  class DashboardPostsService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      { 
        posts: PostFilters::PostFiltersService.new(Post.all, filter_params).call 
      }
    end

    private

    def filter_params
      @params.permit(user_ids: [], category_ids: [], title: nil)
    end
  end

  private_constant :DashboardPostsService
end
