class UsersController < ApplicationController

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.present?
      flash.now[:success] = "Welcome #{@user.user_name}!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params [:id])
  end

  private

    def user_params
      params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end

end
