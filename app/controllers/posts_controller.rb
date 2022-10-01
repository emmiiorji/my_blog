class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @posts = @user ? Post.where(author: @user) : nil
  end

  def show
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id])
    @post = -1 if !@post || @post[:author_id] != @user[:id]
    @comments = Comment.where(post: @post)
  end
end
