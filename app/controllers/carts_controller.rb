class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:id])
    session[:cart] ||= Hash.new(0)
    session[:cart][accessory.id.to_s] = session[:cart][accessory.id.to_s] + 1
    flash[:notice] = "Added #{pluralize(session[:cart][accessory.id.to_s], accessory.title)} to your cart."
    redirect_to request.referer
  end
end
