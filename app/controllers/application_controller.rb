require 'google/cloud/translate'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_cart
  helper_method :current_user, :interpret

  def interpret(string)
    translator = Google::Cloud::Translate.new(project_id: ENV['TRANSLATE_PROJECT_KEY'], credentials: '/Users/sabrinarobinson/Turing/2mod/projects/wheel-deal/Wheel-Deal-0dc89bb2d142.json')
    locale = request.env["HTTP_ACCEPT_LANGUAGE"].split(",").first || 'en'
    locale = locale.split("-").first if '-'.in? locale
    HTMLEntities.new.decode(translator.translate(string, to: locale))
  end

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
