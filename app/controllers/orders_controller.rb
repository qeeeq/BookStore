class OrdersController < ApplicationController
  before_action :set_order
  before_action :build_order_steps
  respond_to :js, only: [:update]
  respond_to :html
  skip_before_action :verify_authenticity_token
  before_action :set_customer#, only: [:update]


	def index
    @orders = Order.all
  end

  def new
  end

  def create
  end

  def update
    if @order.update(order_params)
      respond_to do |format|
        format.html { redirect_to :action => "show", :step => 2 }
      end
    else
      respond_to do |format|
        format.html { redirect_to :action => "show", :step => 1 }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end

    # byebug
    # if @order.update(order_params)
    #   respond_to do |format|
    #     format.html { redirect_to :action => "show", :step => 2 }
    #     format.js
    #     format.json { render :show, status: :updated, location: @order }
    #   end
    # else
    #   redirect_to root_path
    # end

    # if params[:step] == "1"
      # ...
      # @step_builder.update_credit_card(order_params)
      # Order.find(params[:credit_card_id])
    # end

  end

  def show
    if params[:step] == "2"
      OrderSteps.new(@order).call
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


  private

    def set_order
      # if current_customer.current_order
      #   @order = current_customer.current_order
      # else
      #   respond_to do |format|
      #     format.html { redirect_to root_path, notice: 'order nil' }
      #     format.json { head :no_content }
      #   end
      # end
      @order = current_customer.current_order
    end

    def build_order_steps
      @step_builder = OrderSteps.new(@order)
    end

    # def build_order_steps
    #   @step_builder = OrderSteps.new(@order, user: current_customer)
    # end

    # def set_credit_card
    #   @credit_card = CreditCard.find(params[:id])
    # end

    def set_customer
      @customer = current_customer
    end

    def order_params
      # params.require(:order).permit(
      #   :credit_card_id,
      #           shipping_address: [:street_address, :zip, :city, :phone],
      #           billing_address_attributes:  [:bil_address, :zip, :city, :phone],
      #           delivery: [:id],
      #           shipping: [:check],
      #           order_id: [:order_id])
      params.require(:order).permit(
        :credit_card_id,
                shipping_address: [:street_address, :zip, :city, :phone],
                billing_address_attributes: [:bil_address, :zip, :city, :phone],
                delivery: [:id],
                shipping: [:check])
    end
end