class PostsController < ApplicationController
  def index
    @user = User.find_by(id: params[:user_id])
    @posts = Post.where(author: @user)
  end

  def show
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id])
    @comments = Comment.where(post: @post)
  end
end
