class OrdersController < ApplicationController
  before_action :set_order
  
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
    if condition
      
    end
  end

  def edit
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_order
    @order = current_customer.current_order
  end
  
end