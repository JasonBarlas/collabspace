module PostFilters
  class PostFiltersService
    def initialize(posts, filters)
      @posts = posts
      @filters = filters
    end

    def call
      filter_by_users
      filter_by_categories
      filter_by_title
      @posts
    end

    private

    def filter_by_users
      if @filters[:usernames].present?
        user_ids = User.where(username: @filters[:usernames]).pluck(:id)
        @posts = @posts.where(user_id: user_ids)
      end
    end

    def filter_by_categories
      if @filters[:categories].present?
        category_ids = Category.where(name: @filters[:categories]).pluck(:id)
        @posts = @posts.where(category_id: category_ids)
      end
    end

    def filter_by_title
      if @filters[:title].present?
        @posts = @posts.where("title ILIKE ?", "%#{@filters[:title]}%")
      end
    end
  end
end
