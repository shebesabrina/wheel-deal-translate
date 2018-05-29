class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:id])
    session[:cart] ||= Hash.new(0)
    id_string = accessory.id.to_s
    session[:cart][id_string] += 1
    flash[:notice] = "Added #{session[:cart][accessory.id.to_s]} #{accessory.title} to your cart."
    redirect_to request.referrer
  end

  def show
    # accessory = Accessory.find(params[:id])
  end
end
