class OrderItemsController < ApplicationController
	before_action :load_order, only: [:create]

	def index
		@order_items = OrderItem.all
	end

	def create
		@order.add_order_item(params[:book_id])
		respond_to do |format|
			format.html { redirect_to order_path(@order.id, step: params[:step].to_i + 1), notice: 'Successfully added product to order.' }
			# format.html { redirect_to order_path(current_customer.current_order, step: 1), notice: 'Successfully added product to order.' }
		end
	end

	def destroy
		@order_item = OrderItem.find(params[:id])
	  @order_item.destroy
	  respond_to do |format|
	    format.html { redirect_to order_path, notice: 'order_item was successfully destroyed.' }
	    format.json { head :no_content }
	  end
	end

	private
	def load_order
		@order = current_customer.current_order
	end
end
