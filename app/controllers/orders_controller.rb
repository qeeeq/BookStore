class OrdersController < ApplicationController
  before_action :set_order
  before_action :build_order_steps
  
	def index
    @orders = Order.all
  end

  def new
  end

  def create
  end

  def update
    @step_builder.update(order_params)
  end

  def show
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

  private

  def set_order
    @order = current_customer.current_order
  end

  def build_order_steps
    @step_builder = OrderSteps.new(@order)
  end

  def order_params
    params.permit(shipping_address: [:street_address, :zip, :city, :phone],
              billing_address:  [:street_address, :zip, :city, :phone],
              credit_card:      [:credit_card_id],
              delivery: [:id],
              shipping: [:check])
  end
end