class CustomersController < ApplicationController
	before_action :set_customer#, only: [:create]

	def update
		if @customer.update(params1)
			respond_to do |format|
				format.html { redirect_to :action => "show" }
			end
		end
	end

	def show
		# byebug
		@customer.build_address unless @customer.address
	end

	private
  def set_customer
    @customer = current_customer
  end

	def params1
		params.require(:customer).permit(address_attributes: [:id, :address])

		# params.fetch(:user).permit(credit_cards: [:id, :cvv], addresses: [])
	end
end