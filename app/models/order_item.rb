class OrderItem < ApplicationRecord
	belongs_to :orders
	has_many :books
end
