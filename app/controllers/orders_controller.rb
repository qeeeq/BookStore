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

  # def updater_credit_card
  #   @step_builder.update_credit_card(order_params)
  # end

  # def updater_billing_address
  #   @step_builder.update_billing_address(order_params)
  # end

  def update
    @order.update(order_params)
    # if params[:step] == "1"
      # if @order.update(order_params)
        # redirect_to :action => "show", :step => 2

      # else
      #   redirect_to root_path
      # end
      # @step_builder.update_credit_card(order_params)
      # Order.find(params[:credit_card_id])
      # if @order.update(order_params)
      #   render "steps/billing_address"
      # else
      #   redirect_to root_path
      # end
      
    # end
    
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
    params.require(:order).permit(
      :credit_card_id,
              shipping_address: [:street_address, :zip, :city, :phone],
              billing_address:  [:street_address, :zip, :city, :phone],
              delivery: [:id],
              shipping: [:check],
              order_id: [:order_id])
    # params.require(:order).permit
    # (shipping_address: [:street_address, :zip, :city, :phone],
    #           billing_address:  [:street_address, :zip, :city, :phone],
    #           credit_card:      [:credit_card_id],
    #           delivery: [:id],
    #           shipping: [:check])
  end
end