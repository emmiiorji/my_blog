class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user ? @user.recent_posts : nil
  end
end
