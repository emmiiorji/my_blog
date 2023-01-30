class UsersController < ApplicationController
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @user = User.find_by(id: params[:id])
    @recent_posts = @user ? @user.recent_posts : nil
  end
end
