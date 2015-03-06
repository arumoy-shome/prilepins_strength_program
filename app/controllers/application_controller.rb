class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def full_title user, title
    base_title = "Prilepin's Strength Program"
    if user.empty? || title.empty?
      return base_title
    else
      "#{user} | #{title}"
    end
  end
end
