class OrderItem < ApplicationRecord
	belongs_to :ordered_item, polymorphic: true
end
