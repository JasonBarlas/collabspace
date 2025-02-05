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
      if @filters[:user_ids].present?
        @posts = @posts.where(user_id: @filters[:user_ids])
      end
    end

    def filter_by_categories
      if @filters[:category_ids].present?
        @posts = @posts.where(category_id: @filters[:category_ids])
      end
    end

    def filter_by_title
      if @filters[:title].present?
        @posts = @posts.where("title ILIKE ?", "%#{@filters[:title]}%")
      end
    end
  end
end
