class BillingAddress < ApplicationRecord
	belongs_to :order
	has_many :addresses, as: :addressed
end
