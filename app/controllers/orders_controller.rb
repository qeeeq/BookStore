class OrdersController < ApplicationController
  before_action :set_order
  before_action :current_url_step, only: [:update,:show]

  skip_before_action :verify_authenticity_token
  respond_to :js, only: [:update]
  respond_to :html

  # before_action :set_customer#, only: [:update]
  # before_action :build_order_steps

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

    # if @order.update(credit_card_params)
    #   respond_to do |format|
    #     format.html { redirect_to :action => "show", :step => 2 }                         
    #   end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to :action => "show", :step => 1 }
    #     format.json { render json: @credit_card.errors, status: :unprocessable_entity }
    #   end
    # end

    # if @order.update(address_params)
    #   respond_to do |format|
    #     format.html { redirect_to :action => "show", :step => 3 }                         
    #   end
    # else
    #   respond_to do |format|
    #     format.html { redirect_to :action => "show", :step => 2 }
    #     format.json { render json: @credit_card.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def show
    # byebug
    if @current_step["step"] == "2"
      if @order.credit_card.present? 
        @order.build_billing_address unless @order.billing_address
        @order.build_shipping_address unless @order.shipping_address
      else
        respond_to do |format|
          format.html { redirect_to :action => "show", :step => 1 }
          flash.now[:notice] = "noticenoticenotice"
        end
      end
    end

    if @current_step["step"] == "3"
      if @order.credit_card.blank?
        respond_to do |format|
          format.html { redirect_to :action => "show", :step => 1 }
        end
      elsif @order.billing_address.blank? || @order.shipping_address.blank?
        respond_to do |format|
          format.html { redirect_to :action => "show", :step => 2 }
        end
      else
        @order.update(status: :completed)
      end
    end
    if @current_step["step"] == "4"
      @order.update(status: :shipped)
    end
    # OrderSteps.new(@order).call
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

  def current_url_step
    @current_step = Rack::Utils.parse_query URI(request.fullpath).query
  end

  # def build_order_steps
  #   @step_builder = OrderSteps.new(@order)
  # end

  # def set_credit_card
  #   @credit_card = CreditCard.find(params[:id])
  # end

  # def set_customer
  #   @customer = current_customer
  # end
  # byebug

  # def credit_card_params
  #   params.require(:order).permit(:credit_card_id)
  # end

  # def address_params
  #   params.require(:order).permit(
  #             billing_address_attributes: [:id, :bil_address, :zip, :city, :phone],
  #             shipping_address_attributes: [:id, :ship_address, :zip, :city, :phone])
  # end

  def order_params
    params.require(:order).permit(
              :credit_card_id,
              billing_address_attributes: [:id, :bil_address, :zip, :city, :phone],
              shipping_address_attributes: [:id, :ship_address, :zip, :city, :phone],
              delivery: [:id])
  end
end
