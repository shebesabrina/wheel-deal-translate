class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:id])
    @cart.add_cart(params[:id])
    session[:cart] = @cart.contents
    flash[:notice] = "Added #{@cart.count_of(accessory.id)} #{accessory.title} to your cart."

    redirect_to request.referrer
  end

  def show
    @contents = @cart.contents
    @items = Accessory.all
  end

  def destroy
    @cart.delete_accessory(params[:id])
    accessory = Accessory.find(params[:id])
    flash[:notice] = "Successfully removed #{accessory.title} from your cart."
    
    redirect_to cart_path
  end

  def update
    @contents.update(contents_pararms)
    redirect_to request.referrer
  end

  private

  def contents_pararms
    params.require(:accessory).permit(:price)
  end
end
