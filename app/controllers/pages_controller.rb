class PagesController < ApplicationController
  def index
    @content_option = params[:content_option] || "posts"

    @new_post = Post.new
    @categories = Category.all

    @posts = PostFilterService.new(Post.all, filter_params).call

    @new_friendship = Friendship.new
    @friends = current_user.all_friends
    @non_friends = current_user.all_non_friends
  end

  private

  def filter_params
    params.permit(user_ids: [], category_ids: [], title: nil)
  end
end
