class PostsController < ApplicationController
  def index
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @posts = @user ? Post.where(author: @user).paginate(page: params[:page], per_page: 5) : nil
  end

  def show
    @users = User.all
    @user = User.find_by(id: params[:user_id])
    @post = Post.find_by(id: params[:id])
    @post = -1 if !@post || @post[:author_id] != @user[:id]
    @comments = Comment.where(post: @post)
  end

  def new
    @post = Post.new
  end

  def create
    author = current_user
    post = Post.new(params.require(:post).permit(:title, :text))
    post.author = author

    if post.save
      redirect_to user_url(author)
    else
      render :new, locals: { post: }
    end
  end
end
