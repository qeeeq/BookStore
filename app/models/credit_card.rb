class CreditCard < ApplicationRecord
	validates :number, presence: true
	validates :CVV, presence: true
	validates :expiration_month, presence: true
	validates :expiration_year, presence: true
	validates :firstname, presence: true
	validates :lastname, presence: true
	
	def name
		"#{number}"
	end

	belongs_to :customer
	has_many :orders

	
end
