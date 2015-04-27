class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = current_user.posts.new(posts_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to home_path, notice: 'Post was successfully published.' }
      else
        format.html { render 'static_pages/home' }
      end
    end
  end

  def destroy
    User.find(params[:user_id]).posts.find(params[:id]).destroy
    flash[:notice] = "Post destroyed."
    redirect_to home_path
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
