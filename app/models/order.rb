class Order < ApplicationRecord
	validates :total_price, presence: true,
						numericality: { greater_than_or_equal_to: 0 }
	validates :completed_date, presence: true
	# validates :status, presence: true
	validates :customer_id, presence: true

	enum status: { in_progress: 0, completed: 1, shipped: 2}

	belongs_to :customer
	belongs_to :credit_card
	has_many :order_items
	# has_one :billing_address
	# has_one :shipping_address

end
