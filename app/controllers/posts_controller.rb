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
    @post.destroy
    respond_to do |format|
      format.html { redirect_to user_posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private

  def posts_params
    params.require(:post).permit(:content)
  end
end
