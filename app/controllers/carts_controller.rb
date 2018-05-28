class CartsController < ApplicationController

  def create
    accessory = Accessory.find(params[:id])
    flash[:notice] = "Added #{accessory.title} to your cart"
    redirect_to request.referer
  end
end
