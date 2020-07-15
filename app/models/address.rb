class Address < ApplicationRecord
	belongs_to :addressed, polymorphic: true
end
