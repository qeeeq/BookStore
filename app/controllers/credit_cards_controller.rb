class CreditCardsController < ApplicationController
  before_action :set_credit_card, only: [:show, :edit, :update, :destroy], unless: [:destroy_all]
  before_action :set_customer, only: [:create]
  before_action :set_order
  # GET /credit_cards
  # GET /credit_cards.json
  def index
    @credit_cards = current_customer.credit_cards
  end

  # GET /credit_cards/1
  # GET /credit_cards/1.json
  def show
  end

  # GET /credit_cards/new
  def new
    @credit_card = CreditCard.new
  end

  # GET /credit_cards/1/edit
  def edit
  end

  # POST /credit_cards
  # POST /credit_cards.json
  def create
    @credit_card = @customer.credit_cards.new(credit_card_params)
    # @credit_card = Order.add_card
    respond_to do |format|
      if @credit_card.save
        @customer.update(credit_card_id: @credit_card.id)
        format.html { redirect_to order_path(@order.id, step: 1), notice: 'Credit card was successfully created.' }
        format.json { render :show, status: :created, location: @credit_card }
      else
        format.html { render :new }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_cards/1
  # PATCH/PUT /credit_cards/1.json
  def update
    respond_to do |format|
      if @credit_card.update(credit_card_params)
        format.html { redirect_to order_path(@order.id, step: 1), notice: 'Credit card was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_card }
      else
        format.html { render :edit }
        format.json { render json: @credit_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_cards/1
  # DELETE /credit_cards/1.json
  def destroy
    @credit_card.destroy
    respond_to do |format|
      format.html { redirect_to credit_cards_url, notice: 'Credit card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def destroy_all
    @credit_cards = current_customer.credit_cards
    # @events = user.events.where(title: "FIRST")
    # Or If you just wanted to delete all Events except deleting user events then @events = Event.where(title: "FIRST")
    # @credit_cards = CreditCard.all 
    @credit_cards.each do |cc|
      cc.destroy
    end
    respond_to do |format|
      format.html { redirect_to credit_cards_url, notice: 'All credit_cards was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card
      @credit_card = CreditCard.find(params[:id])
    end

    def set_customer
      @customer = current_customer
    end

    # Only allow a list of trusted parameters through.
    def credit_card_params
      params.fetch(:credit_card, {}).permit(:number, :CVV, :expiration_month, :expiration_year, :firstname, :lastname, :customer_id)
    end

    def set_order
      @order = current_customer.current_order
    end
end
