class CreditCard < ApplicationRecord
	validates :title, presence: true

	belongs_to :customer
	has_many :orders
end
