class OrderItem < ApplicationRecord
	belongs_to :book
	belongs_to :order
	# after_save :recalculate_total!

	private
	def recalculate_total!
		order.calculate_total
	end

end
