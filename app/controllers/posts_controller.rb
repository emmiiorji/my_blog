class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author: @user)
  end
end
