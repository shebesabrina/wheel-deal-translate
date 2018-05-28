class ApplicationController < ActionController::Base
  before_action :set_cart

  def set_cart
    @cart ||= Cart.new(session[:cart])
  end
end
