class Book < ApplicationRecord
	validates :title, presence: true
	validates :price, presence: true
	validates :books_in_stock, presence: true
	belongs_to :author
	belongs_to :category

end
