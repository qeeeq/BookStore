class Rating < ApplicationRecord
	validates :rating_number, :inclusion => 1..10, presence: true
	belongs_to :book,  optional: true
	belongs_to :customer, optional: true

	# after_save :calc_average_rating

	# def calc_average_rating
		# book.average_rating
	# end
end
