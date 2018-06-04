class CartsController < ApplicationController
  include ActionView::Helpers::TextHelper

  def create
    accessory = Accessory.find(params[:id])
    @cart.add_item_cart(params[:id])
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
    flash[:notice] = "Successfully removed #{view_context.link_to("#{accessory.title}", accessory_path(accessory))} from your cart.".html_safe

    redirect_to cart_path
  end
  #
  # def update
  #   @contents.update(contents_pararms)
  #   redirect_to request.referrer
  # end

  def update
    accessory = Accessory.find(params[:item_id])
    @cart = Cart.new(session[:cart])
    if params[:decrease]
      if @cart.contents[accessory.id.to_s] <= 1
        delete_accessory(accessory.id.to_s)
        @cart = Cart.new(session[:cart])
      else
        @cart.reduce_item_cart(accessory.id)
      end
    else
      @cart.add_item_cart(accessory.id)
    end
    session[:cart] = @cart.contents
    redirect_to cart_path
  end

  private

def delete_accessory(id)
  accessory = Accessory.find(id)
  session[:cart].delete(id)
  flash[:notice] = "Successfully removed #{view_context.link_to accessory.title, accessory_path(accessory)} from your cart"
end

  def contents_pararms
    params.require(:accessory).permit(:price)
  end
end
