class OrderSteps
  attr_reader :order
  # include AbstractController::Rendering

  def initialize(order) #если передаем @order, OrderSteps.new(@order), получается @order = @order :)
    @order = order
  end

  def update_credit_card(order_params)




    # case params[:step]
    # when '1'
      # credit_card = order.customer.credit_cards.find_by(number: params[:credit_card][:number])
      # byebug
      # if credit_card
        # order.update(credit_card_id: credit_card.id)
      # else
        # res = order.customer.credit_cards.create(params[:credit_card])
        # order.update(credit_card_id: res.id)
      # end
      # order.create_credit_card(params[:credit_card])
    # end
  end

	# def credit_card
 #    order.credit_card || order.customer.credit_cards.first || CreditCard.new
	# end

def update_billing_address(params)
  billing_address = order.customer.billing_address.find_by(bil_address: params[:billing_address][:bil_address])
  if billing_address
    order.update(credit_card_id: credit_card.id)
  end
end


  private
  	def credit_card_params
  	  params.fetch(:credit_card, {}).permit(:number, :CVV, :expiration_month, :expiration_year, :firstname, :lastname, :customer_id)
  	end

    def set_customer
      @customer = current_customer
    end

    # def set_credit_card
    #   @credit_card_step = CreditCard.find(params[:id])
    # end
      # def order_params
      #   params.require(:order).permit(
      #   :credit_card_id,
      #         shipping_address: [:street_address, :zip, :city, :phone],
      #         billing_address:  [:street_address, :zip, :city, :phone],
      #         delivery: [:id],
      #         shipping: [:check],
      #         order_id: [:order_id])
      # end
end