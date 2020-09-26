class Book < ApplicationRecord
	validates :title, presence: true
	validates :price, presence: true
	validates :books_in_stock, presence: true
	
	belongs_to :author
	belongs_to :category
	has_many :ratings
	has_many :order_items

	has_one_attached :image

	accepts_nested_attributes_for :ratings

	self.per_page = 2

	def book_title
		"#{title}"
	end

	def average_rating
		rating_av = Rating.average(:rating_number)
		update(rating_number: rating_av)
		return rating_av
	end

end
