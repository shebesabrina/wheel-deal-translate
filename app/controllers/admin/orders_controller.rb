class Admin::OrdersController < Admin::BaseController
  def index
    binding.pry
    @orders = Order.all
    @all_orders = Order.all
    @grouped_by_status = @orders.by_status
    @paid_orders = Order.orders_paid
    @cancelled_orders = Order.orders_cancelled
    @ordered_orders = Order.orders_ordered
    @completed_orders = Order.orders_completed
  end

  def show
    @order = Order.find(params[:id])
  end

  def status
    redirect_to :index
  end
end