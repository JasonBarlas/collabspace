class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    render json: { title: @post.title, content: @post.content }
  end      
end
