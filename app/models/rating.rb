class Rating < ApplicationRecord
	validates :rating_number, :inclusion => 1..10, presence: true
	belongs_to :book,  optional: true
	belongs_to :customer, optional: true

	# after_save :calc_average_rating

	# def calc_average_rating
		# book.average_rating
	# end

	def current_rating
		# @rating = Rating.find_or_create_by(book_id: @book.id, customer_id: current_customer.id)
		# @rating ||= ratings.find_or_create_by(book_id: @book.id, customer_id: current_customer.id)
	end
end
