class Order < ApplicationRecord
	# validates :total_price, presence: true,
						# numericality: { greater_than_or_equal_to: 0 }
	# validates :completed_date, presence: true
	# validates :status, presence: true
	validates :customer_id, presence: true

	enum status: { in_progress: 0, completed: 1, shipped: 2 }

	belongs_to :customer
	belongs_to :credit_card
	has_many :order_items
	# has_one :billing_address
	# has_one :shipping_address

	def add_order_item(book_id)
		@order_item = order_items.where('book_id = ?', book_id).first
		if @order_item.save
			# increase the quantity of order_item in order
			@order_item.quantity + 1
		else
			# if order_item does not exist in order
			@order_item.create(book_id: book_id, quantity: 1)
			# order.order_items << OrderItem.new(order_item_id: order_item_id, quantity: 1)
		end
	end

	def calculate_total
		# self.total_price = order_items.each {  }
		# current_item.quantity ???
	end


end
