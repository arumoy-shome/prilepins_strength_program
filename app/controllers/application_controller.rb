class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    session[:return_to] || user_path(@user)
    clear_return_to
  end

  def after_sign_out_path_for(resource)
    home_path
  end

  private

  def clear_return_to
    session[:return_to] = nil
  end
end
