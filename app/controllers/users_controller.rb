class UsersController < ApplicationController

  def home
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def sign_up
    @user = User.new
  end
end
