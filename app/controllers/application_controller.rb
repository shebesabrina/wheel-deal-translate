class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user

  def not_found
    raise AbstractController::ActionNotFound.new('404 Not Found')
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user?
    User.find(params[:id]) == current_user
  end

  def current_admin?
    current_user && current_user.admin?
  end

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
