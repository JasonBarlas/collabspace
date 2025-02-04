class PagesController < ApplicationController
    def index
        @posts = Post.limit(20)
    end
end
