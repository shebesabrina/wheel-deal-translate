class Admin::OrdersController < Admin::BaseController
  def index
    @order =
    @orders = Order.all
    @all_orders = Order.all
    @grouped_by_status = @orders.by_status
    @paid_orders = Order.orders_paid
    @cancelled_orders = Order.orders_cancelled

    if params[:type] == 'cancelled'
    @orders = Order.orders_cancelled
  elsif params[:type] == 'completed'
    @orders = Order.orders_completed
  elsif params[:type] == 'ordered'
    @orders = Order.orders_ordered
  elsif params[:type] == 'paid'
    @orders = Order.orders_paid
  end
  end

  def show
    @order = Order.find(params[:id])
  end

  def status
    redirect_to :index
  end
end
