class BillingAddress < ApplicationRecord
	belongs_to :order
	before_save :remove_prev_address


  def remove_prev_address
    if @billing_address
      @billing_address.destroy
    end
  end

  
end
