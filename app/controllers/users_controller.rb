class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :store_location
  before_action :admin_only, only: :destroy

  def index
    @all_users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to(all_users_path)
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end

  def admin_only
    redirect_to(home_path) unless current_user.admin?
  end
end
