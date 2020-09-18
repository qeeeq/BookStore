class BillingAddressesController < ApplicationController
  # before_action :set_billing_address, only: [:show, :edit, :update, :destroy]
  before_action :set_order#, only: [:create]
  # before_action :set_customer, only: [:create]
  # # GET /billing_addresses
  # # GET /billing_addresses.json
  def index
    @billing_addresses = @order.billing_address
    # @billing_addresses = BillingAddress.all
  end

  # # GET /billing_addresses/1
  # # GET /billing_addresses/1.json
  def show
  end

  # # GET /billing_addresses/new
  # def new
  #   @billing_address = BillingAddress.new
  # end

  # # GET /billing_addresses/1/edit
  # def edit
  # end

  # # POST /billing_addresses
  # # POST /billing_addresses.json
  # def create
  #   # byebug
  #   # @billing_address = @order.new(billing_address_params.merge(order: @order))
  #   @billing_address = BillingAddress.new(billing_address_params.merge(order: @order))
  #   # @billing_address = @order.billing_address.new(billing_address_params)

  #   # byebug
    
  #   respond_to do |format|
  #     # byebug
  #     if @billing_address.save
  #       @order.update({:billing_address_id => [@billing_address.id]})
  #       format.html { redirect_to order_path(@order.id, step: 2), notice: 'Billing address was successfully created.' }
  #       format.json { render :show, status: :created, location: @billing_address }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @billing_address.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # PATCH/PUT /billing_addresses/1
  # # PATCH/PUT /billing_addresses/1.json
  # def update
  #   respond_to do |format|
  #     if @billing_address.update(billing_address_params)
  #       format.html { redirect_to order_path(@order.id, step: 2), notice: 'Billing address was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @billing_address }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @billing_address.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /billing_addresses/1
  # # DELETE /billing_addresses/1.json
  # def destroy
  #   @billing_address.destroy
  #   respond_to do |format|
  #     format.html { redirect_to billing_addresses_url, notice: 'Billing address was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_billing_address
  #     # @billing_address = BillingAddress.find(@order.billing_address.id)
  #     @billing_address = BillingAddress.find(params[:id])
  #   end

  #   # Only allow a list of trusted parameters through.
  #   def billing_address_params
  #     params.fetch(:billing_address, {}).permit(:bil_address, :order_id)
  #   end

  #   def set_customer
  #     @customer = current_customer
  #   end

    def set_order
      @order = current_customer.current_order
    end

end
