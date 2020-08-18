class OrderItemsController < ApplicationController

before_action :load_order, only: [:create]

	def create
		# byebug
		# current_customer.current_order.add_item(params[:book_id])
		# redirect_back(fallback_location: root_path)
		@order_item = OrderItem.new(book_id: params[:book_id], order_id: @order.id)
		format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
	end

	def destroy
	  @order_item.destroy
	  redirect_to root_path
  end

  private
	def load_order
	  begin
	    @order = Order.find(session[:order_id])
	  rescue ActiveRecord::RecordNotFound
	    @order = Order.create(status: "in_progress")
	    session[:order_id] = @order.id
	  end
	end


end
