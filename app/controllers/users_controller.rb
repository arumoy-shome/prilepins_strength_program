class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def create
  end
end
