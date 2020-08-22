class Order < ApplicationRecord
	validates :customer_id, presence: true

	enum status: { in_progress: 0, completed: 1, shipped: 2 }

	belongs_to :customer
	belongs_to :credit_card, optional: true
	has_many :order_items, dependent: :destroy
	# has_one :billing_address
	# has_one :shipping_address

	# def add_order_item(book_id)
	# 	@order_item = order_items.find_or_create_by(book_id: book_id)
	# end

	# def add_order_item(book_id)
	# 	# byebug
	#   @order_item = order_items.find_or_initialize_by(book_id: book_id)
	#   if @order_item.new_record?
	#     @order_item.save!
	#   else
	#     	@order_item.quantity + 1
	#   end
	# end

	# def add_order_item(book_id)
	# 	@order_item = order_items.find_by('book_id = ?', book_id)
	# 	if @order_item
	# 		@order_item.quantity += 1
	# 		@order_item.save
	# 	else
	# 		@order_item = order_items.create(book_id: book_id)
	# 	end
	# 	# save
	# end



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



		# def total_price
		# self.order_items.each do |item|
			# @total = item.book.price.sum(&:price)
		# end
		# @total ||= self.order_items.book.sum(:price)
		# order.order_items.book.sum(:price)
	# end

end
