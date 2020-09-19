class CustomersController < ApplicationController
before_action :set_customer#, only: [:create]

	def show
		@customer
	end

def update
	@customer.update
end
	private

  def set_customer
    @customer = current_customer
  end

	# def permited_params
		# params.fetch(:user).permit(credit_cards: [:id, :cvv], addresses: [])
	# end
end


# /customers/my_profile, to: 'customers#show', as: tratata