class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render json: { title: @post.title, content: @post.content }
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to pages_path(content_option: "posts")
    else
      flash[:alert] = "There was an error creating your post. Please try again."
      redirect_to pages_path(content_option: "new")
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end
