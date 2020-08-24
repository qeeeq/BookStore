class OrderItem < ApplicationRecord
	belongs_to :book
	belongs_to :order

	after_save :calculate_total_price
	after_destroy :calculate_total_price

	private
	def calculate_total_price
		order.calculate_total
		# byebug
	end
end
