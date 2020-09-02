class OrderSteps
  attr_reader :order

  def initialize(order)
    @order = order
  end

# dependency injection?
  # def initialize(?)
  #   @? = ?
  # end

  def update(params)
    case params[:step]
    when '1'
      cc = order.customer.credit_cards.find_by(number: params[:credit_card][:number])
      if cc
        order.update(credit_card_id: cc.id)
      else
        res = order.customer.credit_cards.create(params[:credit_card])
        order.update(credit_card_id: res.id)
      end
      order.create_credit_card(params[:credit_card])
    end
  end

	def credit_card
    order.credit_card || order.customer.credit_cards.first || CreditCard.new
	end

  private
  	def credit_card_params
  	  params.fetch(:credit_card, {}).permit(:number, :CVV, :expiration_month, :expiration_year, :firstname, :lastname, :customer_id)
  	end

    def set_customer
      @customer = current_customer
    end

    def set_credit_card
      @credit_card_step = CreditCard.find(params[:id])
    end
end