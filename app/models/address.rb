class Address < ApplicationRecord
	belongs_to :shipping_address
	belongs_to :billing_address
	belongs_to :addressed, polymorphic: true
end
