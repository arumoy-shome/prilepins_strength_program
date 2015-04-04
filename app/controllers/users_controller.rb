class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  def index
    @all_users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def authentication
    redirect_to(new_user_session_path) unless user_signed_in?
  end
end
