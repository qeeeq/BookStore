class OrdersController < ApplicationController

	def index
    @orders = current_customer.orders # Order.find(params[:customer_id])
  end

  def new
    # customer = Customer.find(params[:customer_id])
    @order = current_customer.orders.new
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      flash[:notice] = "Subject created successfully"
      redirect_to(:action => 'index')
    else
      render 'customers/show'
    end
  end

  def show
    @order = Order.find(params[:customer_id]) 
  end

  def edit
  end

  def delete
  end

  private
  def order_params
    params.require(:order).permit(:customer_id, :order_item_id)
  end
end



end


# def create
	# OrderItem.create(book_id: params[:book_id], order: current_customer.current_order)
	# redirect_to :back
# end

# link_to order_items_path(book_id: 3)