class OrderItemsController < ApplicationController

before_action :load_order, only: [:create]

	def create
		@order_item = OrderItem.create(book_id: params[:book_id], order_id: @order.id, quantity: params[:quantity] || 1)
		@order.add_order_item(params[:book_id])
		# byebug
		respond_to do |format|
			format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
		end
	end

	def destroy
		@order_item = OrderItem.find(params[:id])
		# byebug
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
