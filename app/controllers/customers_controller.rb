class CustomersController < ApplicationController
	before_action :set_customer#, only: [:create]

	def show
		byebug
		@customer.build_address unless @customer.address
	end

	def update
		@customer.update
	end

	private
  def set_customer
    @customer = current_customer
  end

	def permited_params
		params.require(:order).permit(address_attributes: [:id, :address])

		# params.fetch(:user).permit(credit_cards: [:id, :cvv], addresses: [])
	end
end


# /customers/my_profile, to: 'customers#show', as: tratata