class Book < ApplicationRecord
	validates :title, presence: true
	validates :price, presence: true
	validates :books_in_stock, presence: true
	
	belongs_to :author
	belongs_to :category
	has_many :ratings
	has_many :order_items

	has_one_attached :image

	self.per_page = 2

	def book_title
		"#{title}"
	end

end
