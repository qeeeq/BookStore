class Order < ApplicationRecord
	# before_create :load_order
	validates :customer_id, presence: true

	enum status: { in_progress: 0, completed: 1, shipped: 2 }

	belongs_to :customer
	belongs_to :credit_card, optional: true
	has_many :order_items, dependent: :destroy
	# has_one :billing_address
	# has_one :shipping_address

	def add_order_item(book_id)
		@order_item = OrderItem.find_by(book_id: book_id)
		if @order_item
			@order_item.quantity += 1
			@order_item.save
		else
			@order_item = order_items.create(book_id: book_id, quantity: 1)
		end
		
	end

 #  private
	# def load_order
	# 	@order = current_customer.current_order
	# end

	# def total_price
	# 	self.order_items.each do |item|
	# 		@total = item.book.price.sum(&:price)
	# 	end
	# 	@total ||= self.order_items.book.sum(:price)
	# 	order.order_items.book.sum(:price)
	# end

end
