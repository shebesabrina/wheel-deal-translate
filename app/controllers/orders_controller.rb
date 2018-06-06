class OrdersController < ApplicationController

  def create
    @order = Order.create(user_id: current_user.id)
    @order.assign_accessories(@cart.contents)
    redirect_to '/dashboard'
  end

  def show
    @order = Order.find(params[:id])
  end
end