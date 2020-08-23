class OrderItemsController < ApplicationController

before_action :load_order, only: [:create]

def index
	@order_items = OrderItem.all
end


	def create
		# @order_item = OrderItem.create(book_id: params[:book_id], order_id: @order.id, quantity: params[:quantity] || 1)
		@order.add_order_item(params[:book_id])
		respond_to do |format|
			format.html { redirect_to @order, notice: 'Successfully added product to order.' }
		end
	end

	# def create
	# 	@order_item = OrderItem.create(book_id: params[:book_id], order_id: @order.id, quantity: params[:quantity] || 1)
	# 	@order.add_order_item(params[:book_id])
	# 	# byebug
	# 	respond_to do |format|
	# 		format.html { redirect_to @order, notice: 'Successfully added product to order.' }
	# 	end
	# end

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
