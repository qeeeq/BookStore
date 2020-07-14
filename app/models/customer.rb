class Customer < ApplicationRecord
	validates :email, presence: true, uniqueness: true
	has_many :ratings
	has_many :orders
	has_many :credit_cards
end
