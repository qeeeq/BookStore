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
  end

  def edit
  end

  def destroy
  end

  def set_order
    @order = current_customer.current_order
  end

  private
  # def order_params
  #   params.require(:order).permit(:customer_id, :credit_card_id)
  # end
end