class ShippingAddress < ApplicationRecord
	belongs_to :order
	has_many :addresses
end
