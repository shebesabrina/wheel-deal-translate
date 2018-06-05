class OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
  end

  def create
    @order = Order.create(user_id: current_user.id)
    @order.assign_accessories(@cart.contents)
    @accessory_sub_total = @order.sub_total #{pizza_cat, sub_total} with pizza_cat as the accessory title
    @quantity_by_accesory = @order.accessory_quantity #{1=>4} with 1 being the accessory id and 4 being the qty
  end
end