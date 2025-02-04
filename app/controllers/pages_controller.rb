class PagesController < ApplicationController
  def index
    @content_option = params[:content_option] || "posts"
    posts = Post.all
    @posts = PostFilterService.new(posts, filter_params).call
  end

  private

  def filter_params
    params.permit(user_ids: [], category_ids: [], title: nil)
  end
end
