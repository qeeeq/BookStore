class OrdersController < ApplicationController
  before_action :set_order
  
	def index
    @orders = Order.all
  end

  def new
  end

  def create
  end

  def show
    # case params[:status]
    # when '1'
    #   render 'orders/addresses'
    # when '2'
    #   render 'orders/credit_cards'
    # when '3'
    # when '4'
    # else
      #
    # end
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