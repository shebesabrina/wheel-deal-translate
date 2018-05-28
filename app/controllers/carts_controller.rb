class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:id])
    session[:cart] ||= Hash.new(0)
    #init with a 0 value, otherwise you receive nil addition errors on the second add
    cart_add_count = session[:cart][accessory.id.to_s] ||= 0
    session[:cart][accessory.id.to_s] = cart_add_count + 1
    flash[:notice] = "Added #{session[:cart][accessory.id.to_s]} #{accessory.title} to your cart."
    redirect_to request.referrer
  end
end
