class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :store_location
  def index
    @all_users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def store_location
    session[:return_to] = request.fullpath
  end
end
