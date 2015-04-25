class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def create
  end

  def destroy
  end

  private

  def posts_params
    params.require(:posts).permit(:content)
  end
end
