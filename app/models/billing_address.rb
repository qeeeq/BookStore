class BillingAddress < ApplicationRecord
	belongs_to :order
	# before_save :remove_prev_address
	# byebug

	# private
	#   def remove_prev_address
	# 		BillingAddress.destroy_all
	#   end
  
end
