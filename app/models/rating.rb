class Rating < ApplicationRecord
	validates :rating_number, :inclusion => 1..10
	belongs_to :book
	belongs_to :customer
end
