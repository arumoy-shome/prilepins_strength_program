class StaticPagesController < ApplicationController

  def home
    if user_signed_in?
      @post = current_user.posts.new
      @posts = current_user.posts.paginate(page: params[:page])
    end
  end

  def contact
  end

  def about
  end
end
