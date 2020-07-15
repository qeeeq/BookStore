class Address < ApplicationRecord
	belongs_to :shipping_address
	belongs_to :billing_address
end
