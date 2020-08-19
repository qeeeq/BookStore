class OrdersController < ApplicationController

	def index
    @orders = Order.all
    # @orders = current_customer.orders(order_params)
    # Order.find(params[:customer_id])
  end

  def new
  end

  def create
  end

  def show
    @orders = current_customer.orders
    # @order = Order.find(params[:customer_id]) 
  end

  def edit
  end

  def delete
  end

  def add_to_order
    # current_order.add_order_item(params[:order_item_id])
    # render 'orders/show'
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :order_item_id, :credit_card_id)
  end
end







# def create
	# OrderItem.create(book_id: params[:book_id], order: current_customer.current_order)
	# redirect_to :back
# end

# link_to order_items_path(book_id: 3)