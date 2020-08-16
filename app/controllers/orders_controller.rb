class OrdersController < ApplicationController

	def index
    @orders = Order.all 
    # Order.find(params[:customer_id])
  end

  def new
    # customer = Customer.find(params[:customer_id])
    @order = current_customer.orders.new
  end

  def create
    # @order = OrderItem.create(book_id: params[:book_id], order: current_customer.current_order)
    # redirect_to action: 'show'

    @order = Order.create(order_params)
    # if @order.save
    #   flash[:notice] = "Subject created successfully"
    #   redirect_to(:action => 'index')
    # else
    #   render 'customers/show'
    # end
    # render 'orders/show'
  end

  def show
    # @order = Order.find(order_params)
    @order = current_order
    # @order = Order.find(params[:customer_id][:order_item_id]) 
  end

  def edit
  end

  def update
  end

  def delete
  end

  def add_to_order
    current_order.add_item(params[:order_item_id])
    # redirect to
    render 'orders/show'
  end

  private
  def order_params
    params.require(:order).permit(:current_customer_id, :order_item_id)
  end
end







# def create
	# OrderItem.create(book_id: params[:book_id], order: current_customer.current_order)
	# redirect_to :back
# end

# link_to order_items_path(book_id: 3)