module Dashboard
  class DashboardNewService
    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      { 
        new_post: Post.new, 
        categories: Category.all 
      }
    end
  end

  private_constant :DashboardNewService
end