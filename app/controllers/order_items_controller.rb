class OrderItemsController < ApplicationController

	# before_action :set_order_item

	def create
		# byebug
		# @order_item = OrderItem.create(customer_id: current_customer.id)
		# @order_item = OrderItem.find(params[:order_item_id])
		@order_item = current_customer.current_order.order_items.create(book_id: params[:book_id])
		# redirect_back(fallback_location: root_path)
		# redirect_to orders_path
		# render "orders/index"
	end

	def destroy
	  @order_item.destroy
	  redirect_to order_path
  end

  private

  # def set_order_item
  #   @order_item = OrderItem.find(params[:id])
  # end

  # def order_item_params
  # 	params.require(:order_item).permit(:current_customer_id)
  # end
end