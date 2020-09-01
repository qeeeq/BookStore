class Steps
include ActiveModel::Model
before_action :set_customer
before_action :set_credit_card

def initialize
  @instance_of_class_a = ClassA.new
end

# dependency injection?
  # def initialize(?)
  #   @? = ?
  # end

	def create_credit_card
		@credit_card = @customer.credit_cards.new(credit_card_params)
		@credit_card.save
	end

	def credit_card_params
	  params.fetch(:credit_card, {}).permit(:number, :CVV, :expiration_month, :expiration_year, :firstname, :lastname, :customer_id)
	end

  def set_customer
    @customer = current_customer
  end

  def set_credit_card
    @credit_card = CreditCard.find(params[:id])
  end

end