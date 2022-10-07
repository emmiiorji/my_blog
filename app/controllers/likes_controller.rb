class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    if !current_user
      redirect_to new_user_session_url, notice: 'Please, sign in to like'
      return
    end
    author = current_user
    like = Like.new(params.permit(:author, :post))
    like.author = author
    like.post = post

    if like.save
      flash[:success] = 'You liked this post :)'
      redirect_to user_post_path(post[:author_id], post)
    else
      flash.now[:error] = 'Error: Did not like ):'
    end
  end
end
