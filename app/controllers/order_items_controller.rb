class OrderItemsController < ApplicationController

	def create
		# byebug
		current_customer.current_order.add_item(params[:book_id])
		redirect_back(fallback_location: root_path)
	end

	def destroy
	  @order_item.destroy
	  redirect_to order_path
  end
end