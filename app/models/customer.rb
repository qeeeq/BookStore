class Customer < ApplicationRecord
	validates :email, presence: true, uniqueness: true
	has_many :ratings
	has_many :orders
	has_many :credit_cards
	has_many :addresses
	def name
		"#{first_name} #{last_name}"
	end

end
