class Order < ApplicationRecord
	validates :customer_id, presence: true

	enum status: { in_progress: 0, completed: 1, shipped: 2 }

	belongs_to :customer
	belongs_to :credit_card, optional: true
	has_many :order_items
	# has_one :billing_address
	# has_one :shipping_address

	def add_order_item(book_id)
		@order_items = order_items.create(book_id: book_id)
	end

	def calculate_total
		# self.total_price = order_items.each do |item|
		# 	item.book.price * item.quantity
		# end
	end

	# def add_order_item(order_item_id)
	# 	item = order_items.where('order_item_id = ?', order_item_id).first
	# 	if item
	# 		# increase the quantity of item in order
	# 		item.quantity + 1
	# 		# save
	# 	else
	# 		# item does not exist in order
	# 		order.order_items << OrderItem.new(order_item_id: order_item_id, quantity: 1)
	# 	end
	# 	# save
	# end

end
