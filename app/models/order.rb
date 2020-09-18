class Order < ApplicationRecord
	validates :customer_id, presence: true

	enum status: { in_progress: 0, completed: 1, shipped: 2 }

	belongs_to :customer
	belongs_to :credit_card, optional: true
	has_many :order_items, dependent: :destroy
	has_one :billing_address, dependent: :destroy
	has_one :shipping_address

	accepts_nested_attributes_for :billing_address#, allow_destroy: true

	def add_order_item(book_id)
		@order_item = order_items.find_by(book_id: book_id)
		if @order_item
			@order_item.quantity += 1
			@order_item.save
		else
			@order_item = order_items.create(book_id: book_id, quantity: 1)
		end
	end

	def calculate_total
		total_price = 0
		order_items.each do |item|
			result = item.quantity * item.book.price
			total_price += result
		end
		update(total_price: total_price)
	end



end
